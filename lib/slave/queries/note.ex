defmodule Slave.Queries.Note do
  require Ecto.Query

  alias Slave.Repo
  alias Ecto.Query

  @entity Slave.Entities.Note

  def active_with_username(username) do
    @entity
    |> Query.where([d], d.active == true)
    |> Query.where([d], d.username == ^username)
    |> Repo.all
  end

  def active do
    @entity
    |> Query.where([d], d.active == true)
    |> Repo.all
  end

  def delete_by_ids(ids) do
    @entity
    |> Query.where([d], d.id in ^ids)
    |> Repo.delete_all
  end

  def delete_all do
    @entity
    |> Repo.delete_all
  end

  def deactivate(ids) when is_list(ids) do
    @entity
    |> Query.where([d], d.id in ^ids)
    |> Repo.update_all(set: [active: false])
  end
end
