defmodule Evideo.Repo.Migrations.CreateCountry do
  use Ecto.Migration

  def change do
    create table(:country) do
      add :country_name, :string

      timestamps()
    end
  end
end
