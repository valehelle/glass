defmodule GlassWeb.LanguageController do
  use GlassWeb, :controller
  alias Glass.Subscibers
  alias Glass.Subscibers.Account
  alias Glass.Profile
  alias Glass.Profile.Language

  def show(conn, %{"language_id" => id}) do
    language = Profile.get_language!(id)
    render(conn, "show.html", language: language)
  end


  def new(conn, _) do
    user = conn.assigns.current_user
    changeset = Language.changeset(%Language{}, %{}, user)
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"language" => language_params}) do
    user = conn.assigns.current_user
    case Profile.create_language(language_params, user) do
      {:ok, language} ->
        redirect(conn, to: Routes.dashboard_path(conn, :index))
      {:error, changeset} -> 
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"language_id" => id}) do
    user = conn.assigns.current_user
    language = Profile.get_language!(id)
    changeset = Language.changeset(language, %{}, user)
    render(conn, "edit.html", changeset: changeset, language: language)
  end


  def update(conn, %{"language_id" => id, "language" => language_params}) do
    user = conn.assigns.current_user
    language = Profile.get_language!(id)
    case Profile.update_language(language, language_params, user) do
    {:ok, language} ->         
      redirect(conn, to: Routes.dashboard_path(conn, :index))
    {:error, changeset} -> 
      render(conn, "edit.html", changeset: changeset, language: language)
    end
  end
end
