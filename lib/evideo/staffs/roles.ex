defmodule Evideo.Staffs.Roles do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :roles_description, :string, size: 50
  end

  @doc false
  def changeset(login_staff, attrs) do
    login_staff
    |> cast(attrs, [:roles_description])
  end
end
