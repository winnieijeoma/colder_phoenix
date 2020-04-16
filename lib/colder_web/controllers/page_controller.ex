defmodule ColderWeb.PageController do
  use ColderWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
