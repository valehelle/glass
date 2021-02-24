defmodule GlassWeb.AdminController do
  use GlassWeb, :controller
  alias Glass.Profile
  alias Glass.Accounts
  
  def index(conn, _params) do
    user = conn.assigns.current_user
    users = Accounts.list_user()
    if(String.equivalent?(user.email, "hazmiirfan92@gmail.com")) do
      render(conn, "index.html", users: users)
    else
      redirect(conn, to: "/")
    end
  end


end
