defmodule Slave.Responders.Dialog do
  @moduledoc """
  The Dialog Responder.

  It gonna be used to start any new conversation with the slave.
  In case when u start new one, it should deactivate old one and create new one.
  Otherwise simply create new active conversation.
  """

  use Hedwig.Responder
  alias Slave.Services.Dialogs.Prepare
  alias Slave.Structs.Dialog, as: DialogStruct

  respond ~r/note plz/, msg do
    dialog = %DialogStruct{username: msg.user, type: :note}
    { :ok, res } = Prepare.run(dialog)
    emote msg, res
  end
end
