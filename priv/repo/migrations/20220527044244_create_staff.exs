defmodule Evideo.Repo.Migrations.CreateStaff do
  use Ecto.Migration

  def change do
    create table(:staff) do
      add :login_id, references(:login_staff, on_delete: :delete_all)
      add :phone, :string, size: 50
      add :email, :string, size: 50
      add :gender, :string, size: 8
      add :wage, :integer
      timestamps()
    end
  end
end
