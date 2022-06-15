defmodule Evideo.Customers.AddressType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "address_type" do
    field :address_type, :string
    timestamps()
  end

  def changeset(address_type, attrs) do
    address_type
    |> cast(attrs, [:address_type])
  end
end
