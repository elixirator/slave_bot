defmodule Slave.Responders.Notes do
  @moduledoc """
    Responder to CRUD notes
  """

  use Hedwig.Responder
  alias Slave.Services.Notes.Create
  alias Slave.Services.Notes.List
  alias Slave.Services.Notes.Destroy
  alias Hedwig.Message

  hear ~r/note (.*)/, %Message{matches: %{1 => content}, room: room} = msg do
    IO.inspect msg
    emote msg, Create.run(%{username: msg.user.name, room: room, content: content})
  end

  hear ~r/notes list/, msg do
    emote msg, List.run(%{username: msg.user.name})
  end

  hear ~r/destroy (?<all>all) (?=notes)|destroy notes (?<ids>.*)/, msg do
    emote msg, Destroy.run(msg)
  end
end
