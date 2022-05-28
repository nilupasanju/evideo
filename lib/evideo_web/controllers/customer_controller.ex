defmodule EvideoWeb.CustomerController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Customers

  def get_all(conn, _params) do
    customers =
      Customers.list_customers()
      |> Enum.map(fn customer ->
        %{
          id: customer.id,
          email: customer.email,
          name: customer.name,
          phone: customer.phone,
          no_of_rented_copies: customer.no_of_rented_copies,
          username: customer.username,
          customer_password: customer.customer_password
        }
      end)

    Logger.info("customers #{inspect(customers)}")

    IO.puts("#{customers}")

    conn
    |> put_status(:ok)
    |> json(customers)
  end

  def get(conn, %{"id" => id} = params) do
    {:ok, customer} = Customers.get_customer(id)
    Logger.info("State #{inspect(params)}")

    conn
    |> put_status(:ok)
    |> json(%{
      email: customer.email,
      name: customer.name,
      phone: customer.phone,
      no_of_rented_copies: customer.no_of_rented_copies,
      username: customer.username,
      customer_password: customer.customer_password
    })
  end

  def create(conn, params) do
    Logger.info("creating customer with params #{inspect(params)}")

    {:ok, customer} = Customers.create_customer(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: customer.id,
      email: customer.email,
      name: customer.name,
      phone: customer.phone,
      no_of_rented_copies: customer.no_of_rented_copies,
      username: customer.username,
      customer_password: customer.customer_password
    })
  end

  def update(conn, %{"id" => id} = params) do
    Logger.info("Updating customer with params #{inspect(params)}")

    case Customers.update_customer(id, params) do
      {:ok, customer} ->
        conn
        |> put_status(:ok)
        |> json(%{
          id: customer.id,
          email: customer.email,
          name: customer.name,
          phone: customer.phone,
          no_of_rented_copies: customer.no_of_rented_copies,
          username: customer.username,
          customer_password: customer.customer_password
        })

      {:error, :not_found} ->
        conn
        |> put_status(:not_found)
        |> json(%{})
    end
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
