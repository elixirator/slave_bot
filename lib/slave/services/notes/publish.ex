defmodule Slave.Services.Notes.Publish do
  alias Slave.Queries.Note, as: Query

  @bot_name "slave"

  def run do
    Query.active
    |> Enum.group_by(fn(rec) -> rec.room end)
    |> Enum.each(&prepare_and_publish/1)
  end

  defp prepare_and_publish({room, notes}) do
    prepare_message(notes)
    |> publish(room)

    deactivate(notes)
  end

  defp prepare_message(notes) do
    notes
    |> Enum.map(fn(rec) -> "* #{rec.content}" end)
    |> List.insert_at(0, "My Sir, here your notes for the current week:")
    |> Enum.join("\n")
  end

  defp publish(notes, room) do
    pid = :global.whereis_name(@bot_name)
    msg = %Hedwig.Message{
      type: "message",
      room: room,
      text: notes
    }

    Hedwig.Robot.send(pid, msg)
  end

  defp deactivate(notes) do
    notes
    |> Enum.map(fn(rec) -> rec.id end)
    |> Query.deactivate
  end
end
