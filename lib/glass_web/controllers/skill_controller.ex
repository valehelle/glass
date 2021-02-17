defmodule GlassWeb.SkillController do
  use GlassWeb, :controller
  alias Glass.Subscibers
  alias Glass.Subscibers.Account
  alias Glass.Profile
  alias Glass.Profile.Skill
  
  def show(conn, %{"skill_id" => id}) do
    user = conn.assigns.current_user
    skill = Profile.get_skill!(id)
    if user.id == skill.user_id do
        render(conn, "show.html", skill: skill)
    else
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    end
    
  end


  def new(conn, _) do
    user = conn.assigns.current_user
    changeset = Skill.changeset(%Skill{}, %{}, user)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"skill" => skill_params}) do
    user = conn.assigns.current_user
    case Profile.create_skill(skill_params, user) do
      {:ok, skill} ->
        redirect(conn, to: Routes.dashboard_path(conn, :index))
      {:error, changeset} -> 
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"skill_id" => id}) do
    user = conn.assigns.current_user
    skill = Profile.get_skill!(id)
    if user.id == skill.user_id do
      changeset = Skill.changeset(skill, %{}, user)
      render(conn, "edit.html", changeset: changeset, skill: skill)
    else
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    end


  end


  def update(conn, %{"skill_id" => id, "skill" => skill_params}) do
    user = conn.assigns.current_user
    skill = Profile.get_skill!(id)
    case Profile.update_skill(skill, skill_params, user) do
    {:ok, skill} ->         
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    {:error, changeset} -> 
      render(conn, "edit.html", changeset: changeset, skill: skill)
    end
  end
  


  def delete(conn, %{"skill_id" => id}) do
    user = conn.assigns.current_user
    skill = Profile.get_skill!(id)
    if user.id == skill.user_id do
      Profile.delete_skill(skill)
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    else
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    end
  end


end
