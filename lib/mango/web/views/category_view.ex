defmodule Mango.Web.CategoryView do
  use Mango.Web, :view

  def title_case(name) do
    name
    |> String.downcase
    |> String.capitalize
  end
end
