defmodule GlassWeb.BasicController do
  use GlassWeb, :controller
  alias Glass.Subscibers
  alias Glass.Subscibers.Account
  alias Glass.Profile
  alias Glass.Profile.Basic


  def edit(conn, _params) do
    user = conn.assigns.current_user
    basic = user.basic
    basic_changeset = Basic.changeset(basic, %{})
    render(conn, "edit.html", changeset: basic_changeset)
  end


  def update(conn, %{"basic" => basic_param}) do
    user = conn.assigns.current_user
    basic = user.basic
    case Profile.update_basic(basic, basic_param) do
    {:ok, basic} ->         
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    {:error, changeset} -> 
      render(conn, "edit.html", changeset: changeset)
    end
  end
  
end
