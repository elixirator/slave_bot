defmodule Slave.Services.Dialogs.Prepare do
  @moduledoc """
  Dialog preparer is used to deactivate old redundant conversations and
  to create fresh one.
  """

  alias Slave.Entities.Dialog
  alias Slave.Queries.Dialog, as: Query
  alias Slave.Repo

  def run(params) when is_map(params) do
    deactivate_current()

    Dialog.changeset(%Dialog{}, params)
    |> create_new
  end

  defp deactivate_current do
    Query.active
    |> Repo.update_all(set: [active: false])
  end

  defp create_new(dialog) do
    Repo.insert!(dialog)
  end
end
