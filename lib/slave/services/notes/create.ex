defmodule Slave.Services.Notes.Create do
  alias Slave.Repo
  alias Slave.Entities.Note

  def run(params) when is_map(params) do
    Note.changeset(%Note{}, params)
    |> create
  end

  defp create(changeset) do
    case changeset.valid? do
      true ->
        Repo.insert(changeset)
        "Thanks."
      false ->
        "Sorry, something went wrong."
    end
  end
end
