defmodule GlassWeb.WorkController do
  use GlassWeb, :controller
  alias Glass.Subscibers
  alias Glass.Subscibers.Account
  alias Glass.Profile
  alias Glass.Profile.Work
  
  def show(conn, %{"work_id" => id}) do
    user = conn.assigns.current_user
    work = Profile.get_work!(id)
    if user.id == work.user_id do
      render(conn, "show.html", work: work)
    else
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    end
  end


  def new(conn, _) do
    user = conn.assigns.current_user
    changeset = Work.changeset(%Work{}, %{}, user)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"work" => work_params}) do
    user = conn.assigns.current_user
    case Profile.create_work(work_params, user) do
      {:ok, work} ->
        redirect(conn, to: Routes.dashboard_path(conn, :index))
      {:error, changeset} -> 
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"work_id" => id}) do
    user = conn.assigns.current_user
    work = Profile.get_work!(id) 
    if user.id == work.user_id do
      changeset = Work.changeset(work, %{}, user)
      render(conn, "edit.html", changeset: changeset, work: work)
    else
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    end
    
  end


  def update(conn, %{"work_id" => id, "work" => work_params}) do
    user = conn.assigns.current_user
    work = Profile.get_work!(id)
    case Profile.update_work(work, work_params, user) do
    {:ok, work} ->         
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    {:error, changeset} -> 
      render(conn, "edit.html", changeset: changeset, work: work)
    end
  end
  
end
