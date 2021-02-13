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

    %{"start_date" => %{"month" => start_month, "year" => start_year}, "end_date" => %{"month" => end_month, "year" => end_year}} = work_params

    {start_month, _} = Integer.parse(start_month)
    start_month = if start_month < 10 do
              "0#{start_month}"
            else
              start_month
            end
    
    start_date = "#{start_year}-#{start_month}-01"


    {end_month, _} = Integer.parse(end_month)
    end_month = if end_month < 10 do
              "0#{end_month}"
            else
              end_month
            end
    
    end_date = "#{end_year}-#{end_month}-01"


    work_params = %{work_params | "end_date" => end_date }
    work_params = %{work_params | "start_date" => start_date }

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
    %{"start_date" => %{"month" => start_month, "year" => start_year}, "end_date" => %{"month" => end_month, "year" => end_year}} = work_params

    {start_month, _} = Integer.parse(start_month)
    start_month = if start_month < 10 do
              "0#{start_month}"
            else
              start_month
            end
    
    start_date = "#{start_year}-#{start_month}-01"


    {end_month, _} = Integer.parse(end_month)
    end_month = if end_month < 10 do
              "0#{end_month}"
            else
              end_month
            end
    
    end_date = "#{end_year}-#{end_month}-01"


    work_params = %{work_params | "end_date" => end_date }
    work_params = %{work_params | "start_date" => start_date }

    
    case Profile.update_work(work, work_params, user) do
    {:ok, work} ->         
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    {:error, changeset} -> 
      render(conn, "edit.html", changeset: changeset, work: work)
    end
  end
  
end
