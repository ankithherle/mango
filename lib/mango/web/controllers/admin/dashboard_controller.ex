defmodule Mango.Web.Admin.DashboardController do
  use Mango.Web, :controller

  def show(conn, _params) do
    render conn, "show.html"
  end
end
