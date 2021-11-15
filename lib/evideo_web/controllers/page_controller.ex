defmodule EvideoWeb.PageController do
  use EvideoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
