defmodule Slave.Responders.Notes do
  @moduledoc """
    Responder to CRUD notes
  """

  use Hedwig.Responder
  alias Slave.Services.Notes.Create
  alias Slave.Services.Notes.List
  alias Slave.Services.Notes.Destroy
  alias Hedwig.Message

  respond ~r/note (.*)/, %Message{matches: %{1 => content}} = msg do
    emote msg, Create.run(%{username: msg.user, content: content})
  end

  respond ~r/notes list/, msg do
    emote msg, List.run(%{username: msg.user})
  end

  respond ~r/destroy (?<all>all) (?=notes)|destroy notes (?<ids>.*)/, msg do
    emote msg, Destroy.run(msg)
  end
end
