defmodule Evideo.Repo.Migrations.CreateStates do
  use Ecto.Migration

  def change do
    create table(:states) do
      add :state_name, :string
      add :country_id, references(:country, on_delete: :delete_all)
      timestamps()
    end
  end
end
