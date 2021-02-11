defmodule GlassWeb.DashboardController do
  use GlassWeb, :controller
  alias Glass.Profile
  alias Glass.Accounts
  
  def index(conn, _params) do
    user = conn.assigns.current_user
    render(conn, "index.html", user: conn.assigns.current_user)
  end


end
