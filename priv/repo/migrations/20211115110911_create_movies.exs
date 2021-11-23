defmodule Evideo.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :title, :string
      add :year, :integer
      add :description, :string
      add :length, :time
      add :daily_price, :decimal
      add :obselete, :boolean
      timestamps()
    end
  end
end
