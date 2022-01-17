defmodule Evideo.Customers.State do
  use Ecto.Schema
  import Ecto.Changeset
  alias Evideo.Customers.Country

  schema "states" do
    field :state_name, :string
    field :country_id, :integer
    belongs_to :country, Country, define_field: false
    timestamps()
  end

  def changeset(states, attrs) do
    states
    |> cast(attrs, [:state_name, :country_id])
    |> validate_required([:state_name])
  end
end
