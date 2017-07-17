defmodule Mango.Web.Admin.DashboardController do
  use Mango.Web, :controller

  def show(conn, _params) do
    admin = conn.assigns.current_admin
    token = Phoenix.Token.sign(conn, "socket_login", admin.id)
    render conn, "show.html", token: token
  end
end
