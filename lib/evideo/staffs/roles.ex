defmodule Evideo.Staffs.Roles do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :roles_description, :string, size: 50
  end

  @doc false
  def changeset(roles, attrs) do
    roles
    |> cast(attrs, [:roles_description])
  end
end
