defmodule Mango.Web.LayoutView do
  use Mango.Web, :view
  import Mango.Web.CartView, only: [cart_count: 1]

  def cart_link_text(conn) do
    raw """
    <i class="fa fa-shopping-cart"></i> <span class="cart-count">#{cart_count(conn)}</span>
    """
  end
end
