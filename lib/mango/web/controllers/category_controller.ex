defmodule Mango.Web.CategoryController do
  use Mango.Web, :controller
  alias Mango.Catalog

  def show(conn, %{"name" => name}) do
    products = Catalog.get_category_products(name)
    conn
    |> assign(:products, products)
    |> assign(:name, name)
    |> render("show.html")
  end
end
