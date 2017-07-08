defmodule Mango.Web.CheckoutController do
  use Mango.Web, :controller

  def edit(conn, _params) do
    render conn, "edit.html"
  end
end
