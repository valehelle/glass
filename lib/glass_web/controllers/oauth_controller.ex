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
          login
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
    %{"dev_to_token" => dev_token} = oauth_param
    case get_dev_blogs(dev_token) do
      {:ok, blogs} ->
        Profile.add_blogs(user,  blogs)
        if(length(blogs) > 1) do
          blog = List.first(blogs)
          %{"user" => %{"username" => dev_to_username}} = blog
          Profile.update_basic(user.basic, %{"dev_username" => dev_to_username})
        end
        
        #Profile.update_basic(user, dev_to_params)
        redirect(conn, to: "/profile#token-parent")
      {:error} -> 
        changeset = User.token_changeset(user, %{}) |> Ecto.Changeset.add_error(:dev_to_token, "Unable to get the latest blog")
        changeset = %{changeset | action: :insert}
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def get_dev_blogs(access_token) do
    
    url = "https://dev.to/api/articles/me?per_page=6"
    headers = [{"Content-Type", "application/json"}, {"Accept","application/json"}, {"api-key", access_token}]
    case HTTPoison.get url, headers do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> 
        body = Jason.decode!(body)
        {:ok, body}
      {:ok, _} ->
        {:error}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error}
    end 
  end

  def callback(conn, %{"code" => code}) do

    user = conn.assigns.current_user
    url = "https://github.com/login/oauth/access_token"
    options = [{"Content-Type", "application/json"}, {"Accept","application/json"}]
    param = %{"client_id" => "f229649ab635a5539fc9", "client_secret" => Application.get_env(:glass, Glass.Repo)[:github_client_secret], "code" => code}

    case HTTPoison.post url, Jason.encode!(param), options do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> 
        case Jason.decode!(body) do
          %{"access_token" => access_token} ->
            Accounts.update_token(user, %{"repository_token" => access_token})
            {:ok, body} =  get_github_profile(access_token)
            save_projects(user, body)
            redirect(conn, to: "/profile#token-parent")
          %{"error" => error, "error_description" => error_description} ->
             IO.inspect "Error"
            redirect(conn, to: "/profile#token-parent")
        end
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.inspect "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
    
  end

  def save_projects(user, %{"data" => %{"viewer" => %{"login" => github_username, "avatarUrl" => avatarUrl, "pinnedItems" => %{"nodes" => pinned_items}}}}) do
    basic_param = %{"image" => avatarUrl, "github_usename" => github_username}
    Profile.update_basic(user.basic, basic_param)
    Profile.add_projects(user, pinned_items)

  end
  
end
