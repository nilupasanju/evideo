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
    |> cast(attrs, [:name, :email, :phone, :no_of_rented_coppies, :username, :customer_password])
    |> validate_required([:name, :email])
  end


end
