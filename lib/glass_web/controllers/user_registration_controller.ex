defmodule GlassWeb.UserRegistrationController do
  use GlassWeb, :controller

  alias Glass.Accounts
  alias Glass.Accounts.User
  alias GlassWeb.UserAuth

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
      %{"username" => username} = user_params
      user_params = %{user_params | "username" => String.downcase(username)}
    case Accounts.register_user(user_params) do
      {:ok, user} ->

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
