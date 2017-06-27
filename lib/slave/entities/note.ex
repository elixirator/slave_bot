defmodule Slave.Entities.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :content,  :string
    field :username, :string
    field :room,     :string
    field :active,   :boolean

    timestamps()
  end

  def changeset(note, params \\ %{}) do
    note
    |> cast(params, [:content, :username, :room])
    |> validate_required([:content, :username, :room])
  end
end
