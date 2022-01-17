defmodule Evideo.Repo.Migrations.AlterCustomers do
  use Ecto.Migration

  def change do
    alter table(:customers) do
      add :phone, :integer
      add :no_of_rented_copies, :integer
      add :username, :string
      add :customer_password, :string
    end
  end
end
