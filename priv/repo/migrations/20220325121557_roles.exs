defmodule Evideo.Repo.Migrations.Roles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :roles_description, :string, size: 50
    end
  end
end
