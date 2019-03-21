defmodule MvpElixirWeb.PageController do
  use MvpElixirWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
