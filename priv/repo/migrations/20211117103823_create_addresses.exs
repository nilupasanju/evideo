defmodule Evideo.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :address1, :string, size: 50
      add :address2, :string, size: 50
      add :address3, :string, size: 50
      add :city_id, references(:cities, on_delete: :delete_all)
      add :address_type_id, references(:address_type, on_delete: :delete_all)
      timestamps()
    end
  end
end
