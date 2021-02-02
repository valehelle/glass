defmodule GlassWeb.PageController do
  use GlassWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
