defmodule GlassWeb.OauthController do
  use GlassWeb, :controller
  alias Glass.Profile
  alias Glass.Accounts
  alias Glass.Accounts.User

  def get_github_profile(access_token) do
    Neuron.Config.set(json_library: Jason)
    {:ok, resp } = Neuron.query("""
      query { 
        viewer { 
          avatarUrl
          
          pinnedItems(first: 6, types: REPOSITORY) {
            nodes{
              ... on Repository {
                name
                description
                url
                homepageUrl
                repositoryTopics(first: 6){
                  nodes{
                    ... on RepositoryTopic{
                      topic{
                        name
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    """,
    %{},
    url: "https://api.github.com/graphql",
    headers: [authorization: "Bearer #{access_token}"]
    )

    %Neuron.Response{body: body} = resp
    {:ok, body}
  end


  def index(conn, _params) do
    user = conn.assigns.current_user
    render(conn, "index.html", user: conn.assigns.current_user)
  end

  def edit(conn, _) do
    user = conn.assigns.current_user
    changeset = User.token_changeset(user, %{})
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"user" => oauth_param}) do
    user = conn.assigns.current_user
    Accounts.update_token(user, oauth_param) 
    redirect(conn, to: Routes.dashboard_path(conn, :index))
  end

  def callback(conn, %{"code" => code}) do

    user = conn.assigns.current_user
    url = "https://github.com/login/oauth/access_token"
    options = [{"Content-Type", "application/json"}, {"Accept","application/json"}]
    param = %{"client_id" => "f229649ab635a5539fc9", "client_secret" => "750355a8627b0ad5800929112a3701c608619efc", "code" => code}

    case HTTPoison.post url, Jason.encode!(param), options do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> 
        case Jason.decode!(body) do
          %{"access_token" => access_token} ->
            Accounts.update_token(user, %{"repository_token" => access_token})
            {:ok, body} =  get_github_profile(access_token)
            save_profile(user, body)
            redirect(conn, to: Routes.dashboard_path(conn, :index))
          %{"error" => error, "error_description" => error_description} ->
             IO.inspect "Error"
            redirect(conn, to: Routes.dashboard_path(conn, :index))
        end
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.inspect "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
    
  end

  def save_profile(user, %{"data" => %{"viewer" => %{"avatarUrl" => avatarUrl, "pinnedItems" => %{"nodes" => pinned_items}}}}) do
    basic_param = %{"image" => avatarUrl}
    Profile.update_basic(user.basic, basic_param)
    Profile.add_projects(user, pinned_items)

  end
  
end
