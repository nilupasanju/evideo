defmodule Evideo.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :email, :string
    field :name, :string
    field :phone, :integer
    field :no_of_rented_copies, :integer
    field :username, :string
    field :customer_password, :string

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:customer_password, :username, :no_of_rented_copies, :phone, :name, :email])
    |> validate_required([:name, :email])
  end
end
