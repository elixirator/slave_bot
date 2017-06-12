defmodule Slave.Queries.Note do
  require Ecto.Query

  alias Slave.Entities.Note
  alias Slave.Repo
  alias Ecto.Query

  @entity Note

  # Action methods for now
  def active_with_username(username) do
    active
    |> with_username(username)
    |> Repo.all
  end

  def delete_by_ids(ids) do
    with_ids(ids)
    |> Repo.delete_all
  end

  def delete_all do
    @entity
    |> Repo.delete_all
  end

  # Dataset methods in future
  defp with_username(username) do
    Ecto.Queryable.to_query(@entity)
    |> with_username(username)
  end

  defp with_username(query, username) do
    query
    |> Query.where([d], d.username == ^username)
  end

  defp active do
    Ecto.Queryable.to_query(@entity)
    |> active
  end

  defp active(query) do
    query
    |> Query.where([d], d.active == true)
  end

  defp with_ids(ids) do
    Ecto.Queryable.to_query(@entity)
    |> with_ids(ids)
  end

  defp with_ids(query, ids) do
    Query.from(r in query, where: r.id in ^ids)
  end
end
