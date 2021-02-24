defmodule GlassWeb.AdminController do
  use GlassWeb, :controller
  alias Glass.Profile
  alias Glass.Accounts
  
  def index(conn, _params) do
    user = conn.assigns.current_user
    
    if(String.equivalent?(user.email, "hazmiirfan92@gmail.com")) do
      users = Accounts.list_user()
      render(conn, "index.html", users: users)
    else
      redirect(conn, to: "/")
    end
  end


end
