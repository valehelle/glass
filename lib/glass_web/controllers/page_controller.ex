defmodule GlassWeb.PageController do
  use GlassWeb, :controller
  alias Glass.Subscibers
  alias Glass.Subscibers.Account

  def index(conn, _params) do
    render(conn, "index.html")
  end
  
  def new(conn, _params) do
    changeset = Account.changeset(%Account{}, %{})
    render(conn, "new.html", changeset: changeset)
  end
  def create(conn, %{"account" => account_params}) do
    case Subscibers.create_account(account_params) do
      {:ok, account} ->
        redirect(conn, to: Routes.page_path(conn, :success))
      {:error, %Ecto.Changeset{} = changeset} ->
        changeset = %{changeset | action: :insert}
        render(conn, "new.html", changeset: changeset)
    end
  end

  def success(conn, _params) do
    render(conn, "success.html")
  end
end
