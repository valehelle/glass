defmodule GlassWeb.DashboardController do
  use GlassWeb, :controller
  alias Glass.Subscibers
  alias Glass.Subscibers.Account

  def index(conn, _params) do
    render(conn, "index.html")
  end
  
end
