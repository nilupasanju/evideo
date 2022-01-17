defmodule Evideo.Repo.Migrations.CustomerAddress do
  use Ecto.Migration

  def change do
    create table(:customer_address) do
      add :address_id, references(:addresses, on_delete: :delete_all)
      add :customer_id, references(:customers, on_delete: :delete_all)
    end
  end
end
