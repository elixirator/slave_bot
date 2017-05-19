defmodule Slave.Services.Dialogs.Prepare do
  @moduledoc """
  Dialog preparer is used to deactivate old redundant conversations and
  to create fresh one.
  """
  alias Slave.Structs.Dialog

  def run(%Dialog{type: type, username: username}) do
    deactivate_current
    create_new

    {:ok, "Ready to serve You. What should I remember?"}
  end

  defp deactivate_current do
    IO.puts "Current conversation deactiovation"
  end

  defp create_new do
    IO.puts "Creation of new conversation"
  end
end
