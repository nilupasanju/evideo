defmodule Evideo.Repo.Migrations.Enquiry do
  use Ecto.Migration

  def change do
    create table(:enquiry) do
      add :name, :string, size: 50
      add :phone, :integer
      add :email, :string, size: 50
      add :enquiry, :string
      timestamps()
    end
  end
end
