defmodule Evideo.Customers.Country do
  use Ecto.Schema
  import Ecto.Changeset

  schema "country" do
    field :country_name, :string

    timestamps()
  end

  def changeset(country, attrs) do
    country
    |> cast(attrs, [:country_name])
    |> validate_required([:country_name])
  end
end
