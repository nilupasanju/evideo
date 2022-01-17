defmodule Evideo.Repo.Migrations.CreateAddressType do
  use Ecto.Migration

  def change do
    create table(:address_type) do
      add :address_type, :string
      timestamps()
    end
  end
end
