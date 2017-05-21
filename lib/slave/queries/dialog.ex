defmodule Slave.Queries.Dialog do
  require Ecto.Query

  alias Slave.Repo
  alias Slave.Entities.Dialog
  alias Ecto.Query

  @entity Dialog

  def by_params(%{username: username, type: type }) do
    @entity
    |> Query.where([d], d.username == ^username)
    |> Query.where([d], d.type == ^type)
  end

  def active do
    @entity
    |> Query.where([d], d.active == true)
  end
end
