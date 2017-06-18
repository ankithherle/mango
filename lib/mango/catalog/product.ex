defmodule Mango.Catalog.Product do
  @moduledoc """
  A sellable item on the ecommerce site.
  """
  defstruct [:name, :price, :is_seasonal, :category]
end
