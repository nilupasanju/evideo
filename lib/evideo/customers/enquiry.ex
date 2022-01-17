defmodule Evideo.Customers.Enquiry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "enquiry" do
    field :name, :string, size: 50
    field :phone, :integer
    field :email, :string, size: 50
    field :enquiry, :string
    timestamps()
  end

  def changeset(enquiry, attrs) do
    enquiry
    |> cast(attrs, [:name, :phone, :email, :enquiry])
  end
end
