defmodule Slave.Services.Notes.Destroy do
  alias Slave.Queries.Note, as: Query
  alias Hedwig.Message

  def run(%Message{matches: %{"all" => all, "ids" => ids}}) do
    destroy_notes([all, ids])

    "I collected and threw away the garbage, my Master..."
  end

  defp destroy_notes(["", ids]) do
    String.split(ids, ~r{,\s|,})
    |> Query.delete_by_ids
  end

  defp destroy_notes([_, ""]) do
    Query.delete_all
  end
end
