
defmodule EvideoWeb.CustomerController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Customers


  def get_all(conn, _params) do
    customers = Customers.list_customers() |> Enum.map(fn customer ->
      %{
        id: customer.id,
        email: customer.email,
        name: customer.name
      }
    end)
    Logger.info("customers #{inspect(customers)}")

    conn
    |> put_status(:ok)
    |> json(customers)
  end

  def create(conn, params) do
    Logger.info("creating customer with params #{inspect(params)}")

    {:ok, customer} = Customers.create_customer(params)
    conn
    |> put_status(:created)
    |> json(
      %{
        id: customer.id,
        email: customer.email,
        name: customer.name
      }
    )
  end

  def update(conn, %{"id" => id} = params) do
    Logger.info("Updating customer with params #{inspect(params)}")

    {:ok, customer} = Customers.update_customer(id, params)
    conn
    |> put_status(:ok)
    |> json(
      %{
        id: customer.id,
        email: customer.email,
        name: customer.name
      }
    )
  end

  def delete(conn, %{"id" => id} = params) do
    Logger.info("Delete customer with params #{inspect(params)}")
    {:ok, customer} = Customers.delete_customer(id)
    conn
    |> put_status(:ok)
    |> json(%{
      id: customer.id
    })
  end
end
