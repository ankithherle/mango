defmodule Mango.Web.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "pos", Mango.Web.BotChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
