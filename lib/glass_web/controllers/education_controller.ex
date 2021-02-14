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
    %{"start_date" => %{"month" => start_month, "year" => start_year}, "end_date" => %{"month" => end_month, "year" => end_year}} = education_params

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


    education_params = %{education_params | "end_date" => end_date }
    education_params = %{education_params | "start_date" => start_date }


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


  def update(conn, %{"education_id" => id, "education" => education_params}) do
    user = conn.assigns.current_user
    education = Profile.get_education!(id)
    
    %{"start_date" => %{"month" => start_month, "year" => start_year}, "end_date" => %{"month" => end_month, "year" => end_year}} = education_params

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


    education_params = %{education_params | "end_date" => end_date }
    education_params = %{education_params | "start_date" => start_date }

    case Profile.update_education(education, education_params, user) do
    {:ok, education} ->         
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    {:error, changeset} -> 
      render(conn, "edit.html", changeset: changeset, education: education)
    end
  end



  
end
