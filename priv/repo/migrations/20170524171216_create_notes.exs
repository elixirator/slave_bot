defmodule Slave.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :content,  :string, null: false
      add :username, :string, null: false
      add :active,   :boolean, null: false, default: true

      timestamps()
    end

    create index(:notes, :username)
  end
end
