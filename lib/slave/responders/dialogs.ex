defmodule Slave.Responders.Dialog do
  @moduledoc """
  The Dialog Responder.

  It gonna be used to start any new conversation with the slave.
  In case when u start new one, it should deactivate old one and create new one.
  Otherwise simply create new active conversation.
  """

  use Hedwig.Responder
  alias Slave.Services.Dialogs.Prepare

  respond ~r/note plz/, msg do
    params = %{username: msg.user, type: "standup_note"}

    Prepare.run(params)

    emote msg, "Ready to serve You. What should I remember?"
  end
end
