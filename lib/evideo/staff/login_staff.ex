defmodule Evideo.Staffs.LoginStaff do
  use Ecto.Schema
  import Ecto.Changeset

  schema "login_staff" do
    field :first_name, :string, size: 50
      field :last_name, :string, size: 50
      field :username, :string, size: 50
      field :loginpassword, :string, size: 8

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:first_name, :last_name, :username, :loginpassword ])
    |> unique_constraint(:username)
  end
end
