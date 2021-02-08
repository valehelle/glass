defmodule GlassWeb.DashboardController do
  use GlassWeb, :controller
  alias Glass.Profile
  alias Glass.Accounts

  def runGraphQL do
Neuron.Config.set(json_library: Jason)
Neuron.query("""

	query {
		user(login: "valehelle") { 
			pinnedItems(first: 6, types: REPOSITORY) {
				nodes { 
					... on Repository { 
					name 
					} 
				}
			}
		}
	}

    """,
    %{},
    url: "https://api.github.com/graphql",
    headers: [authorization: "Bearer c3844d3fefaa85b8581fc6049f8ad0684afd775a"]
    )
    
  end
  def index(conn, _params) do
    user = conn.assigns.current_user
    render(conn, "index.html", user: conn.assigns.current_user)
  end

  def callback(conn, %{"code" => code}) do

    user = conn.assigns.current_user
    url = "https://github.com/login/oauth/access_token"
    options = [{"Content-Type", "application/json"}, {"Accept","application/json"}]
    param = %{"client_id" => "f229649ab635a5539fc9", "client_secret" => "88233e849bfdc20c1212a21795dfa2ff785f6950", "code" => code}

    case HTTPoison.post url, Jason.encode!(param), options do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> 
        case Jason.decode!(body) do
          %{"access_token" => access_token} ->
            Accounts.update_token(user, %{"repository_token" => access_token}) 
            render(conn, "index.html", user: conn.assigns.current_user)
          %{"error" => error, "error_description" => error_description} ->
            render(conn, "index.html", user: conn.assigns.current_user)
        end
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.inspect "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
    
  end
  
end
