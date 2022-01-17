defmodule Evideo.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :city_name, :string
      add :postcode, :integer
      add :state_id, references(:states, on_delete: :delete_all)
      timestamps()
    end
  end
end
