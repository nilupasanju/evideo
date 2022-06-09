defmodule EvideoWeb.CityController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Customers

  def get_all(conn, _params) do
    cities =
      Customers.list_cities()
      |> Enum.map(fn city ->
        %{
          id: city.id,
          city_name: city.city_name,
          postcode: city.postcode,
          state_id: city.state_id
        }
      end)

    Logger.info("cities #{inspect(cities)}")

    conn
    |> put_status(:ok)
    |> json(cities)
  end

  def create(conn, params) do
    Logger.info("creating city with params #{inspect(params)}")

    {:ok, city} = Customers.create_city(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: city.id,
      city_name: city.city_name,
      postcode: city.postcode,
      state_id: city.state_id
    })
  end

  def update(conn, %{"id" => id} = params) do
    Logger.info("Updating city with params #{inspect(params)}")

    {:ok, city} = Customers.update_city(id, params)

    conn
    |> put_status(:ok)
    |> json(%{
      id: city.id,
      city_name: city.city_name,
      postcode: city.postcode,
      state_id: city.state_id
    })
  end

  def delete(conn, %{"id" => id} = params) do
    Logger.info("Delete city with params #{inspect(params)}")
    {:ok, city} = Customers.delete_city(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: city.id
    })
  end
end
