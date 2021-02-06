defmodule GlassWeb.EducationController do
  use GlassWeb, :controller
  alias Glass.Subscibers
  alias Glass.Subscibers.Account
  alias Glass.Profile
  alias Glass.Profile.Education

  def new(conn, _) do
    user = conn.assigns.current_user
    changeset = Education.changeset(%Education{}, %{}, user)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"education" => education_params}) do
    user = conn.assigns.current_user
    case Profile.create_education(education_params, user) do
      {:ok, education} ->
        redirect(conn, to: Routes.dashboard_path(conn, :index))
      {:error, changeset} -> 
        render(conn, "new.html", changeset: changeset)
    end
    

  end


  
end
