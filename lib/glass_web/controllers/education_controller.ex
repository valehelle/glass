defmodule GlassWeb.EducationController do
  use GlassWeb, :controller
  alias Glass.Subscibers
  alias Glass.Subscibers.Account
  alias Glass.Profile
  alias Glass.Profile.Education


  def show(conn, %{"education_id" => id}) do
    user = conn.assigns.current_user
    education = Profile.get_education!(id)
    if user.id == education.user_id do
      render(conn, "show.html", education: education)
    else
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    end
  end


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

  def edit(conn, %{"education_id" => id}) do
    user = conn.assigns.current_user
    education = Profile.get_education!(id)
    if user.id == education.user_id do
      changeset = Education.changeset(education, %{}, user)
      render(conn, "edit.html", changeset: changeset, education: education)
    else
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    end
  end


  def update(conn, %{"education_id" => id, "education" => education_param}) do
    user = conn.assigns.current_user
    education = Profile.get_education!(id)
    case Profile.update_education(education, education_param, user) do
    {:ok, education} ->         
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    {:error, changeset} -> 
      render(conn, "edit.html", changeset: changeset, education: education)
    end
  end



  
end
