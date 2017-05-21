defmodule Slave.Repo.Migrations.CreateDialogs do
  use Ecto.Migration

  def up do
    DialogTypes.create_type
    create table(:dialogs) do
      add :type,     :dialog_types, null: false
      add :username, :string,       null: false
      add :active,   :boolean,      null: false, default: true

      timestamps()
    end

    execute("CREATE UNIQUE INDEX index_dialogs_on_username_active_idx ON dialogs(type, username) WHERE active = true")
  end

  def down do
    drop table(:dialogs)
    DialogTypes.drop_type
  end
end
