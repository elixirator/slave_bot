defmodule Slave.Entities.Dialog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dialogs" do
    field :type,     DialogTypes
    field :username, :string
    field :active,   :boolean

    timestamps()
  end

  def changeset(dialog, params \\ %{}) do
    dialog
    |> cast(params, [:username, :type])
    |> validate_required([:username, :type])
  end
end
