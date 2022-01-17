defmodule EvideoWeb.CountryController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Customers

  def get_all(conn, _params) do
    countries =
      Customers.list_countries()
      |> Enum.map(fn country ->
        %{
          id: country.id,
          country_name: country.country_name
        }
      end)

    Logger.info("countries #{inspect(countries)}")

    conn
    |> put_status(:ok)
    |> json(countries)
  end

  def create(conn, params) do
    Logger.info("creating country with params #{inspect(params)}")

    {:ok, country} = Customers.create_country(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: country.id,
      country_name: country.country_name
    })
  end

  def update(conn, %{"id" => id} = params) do
    Logger.info("Updating country with params #{inspect(params)}")

    {:ok, country} = Customers.update_country(id, params)

    conn
    |> put_status(:ok)
    |> json(%{
      id: country.id,
      country_name: country.country_name
    })
  end

  def delete(conn, %{"id" => id} = params) do
    Logger.info("Delete country with params #{inspect(params)}")
    {:ok, country} = Customers.delete_country(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: country.id
    })
  end
end
