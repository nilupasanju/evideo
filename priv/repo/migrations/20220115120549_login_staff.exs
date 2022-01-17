defmodule Evideo.Repo.Migrations.LoginStaff do
  use Ecto.Migration

  def change do
    create table(:login_staff) do
      add :first_name, :string, size: 50
      add :last_name, :string, size: 50
      add :username, :string, size: 50
      add :loginpassword, :string, size: 8
    end
    create unique_index(:login_staff, [:username])
  end
end
