defmodule Slave.Services.Notes.List do
  alias Slave.Queries.Note, as: Query
  alias Slave.Repo

  def run(%{username: username}) do
    Query.active_with_username(username)
    |> Enum.map(fn(entity) -> [entity.id, entity.content] end)
    |> Enum.map(fn([id | content]) -> "* #{id} -- #{List.first(content)}" end)
    |> prepare_message
  end

  defp prepare_message([]) do
    "Unfortunatly, it is no messages for now"
  end

  defp prepare_message(messages) do
    messages
    |> List.insert_at(0, "Ok, my master. Check it out.")
    |> Enum.join("\n")
  end
end
