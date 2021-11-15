defmodule Evideo.Movies.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :title, :string
    field :year, :integer
    field :description, :string
    field :length, :time
    field :daily_price, :decimal
    field :obselete, :boolean
    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:id, :title, :year, :description, :length, :daily_price, :obselete])
    |> validate_required([:title])
  end
end
