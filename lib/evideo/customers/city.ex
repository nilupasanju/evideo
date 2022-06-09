defmodule Evideo.Customers.City do
  use Ecto.Schema
  import Ecto.Changeset
  alias Evideo.Customers.State

  schema "cities" do
    field :city_name, :string
    field :postcode, :integer
    field :state_id, :integer
    belongs_to :states, State, define_field: false
    timestamps()
  end

  def changeset(cities, attrs) do
    cities
    |> cast(attrs, [:city_name, :postcode, :state_id])
    |> validate_required([:city_name])
  end
end
