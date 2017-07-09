defmodule Mango.Web.BotChannel do
  use Mango.Web, :channel

  def join("pos", payload, socket) do
    welcome_text = "Hello! Welcome to Mango Point of Sale"
    {:ok, %{message: welcome_text}, socket}
  end

end
