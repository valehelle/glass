defmodule GlassWeb.UserSessionController do
  use GlassWeb, :controller

  alias Glass.Accounts
  alias GlassWeb.UserAuth

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def magic_link_login(conn, %{"token" => token}) do
    {user, hash_uuid} = Accounts.get_user_by_magic_link(token)
    if user do
      UserAuth.magic_link_log_in_user(conn, user, hash_uuid)
    else
      render(conn, "new.html", error_message: "Invalid email or password")
    end

  end

  def create(conn, %{"user" => user_params}) do
    %{"email" => email} = user_params
    
    if user = Accounts.get_user_by_email(email) do
      UserAuth.create_magic_link(conn, user, user_params)
    else
      render(conn, "new.html", error_message: "Invalid email")
    end
  end
  
  def email_pass_create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Accounts.get_user_by_email_and_password(email, password) do
      UserAuth.log_in_user(conn, user, user_params)
    else
      render(conn, "new.html", error_message: "Invalid email or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end
end
