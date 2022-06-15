defmodule EvideoWeb.AddressTypeController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Customers

  def get_all(conn, _params) do
    address_type =
      Customers.list_address_types()
      |> Enum.map(fn address_type ->
        %{
          id: address_type.id,
          address_type: address_type.address_type
        }
      end)

    Logger.info("Enquiries #{inspect(address_type)}")

    conn
    |> put_status(:ok)
    |> json(address_type)
  end

  def create(conn, params) do
    Logger.info("creating enquiry with params #{inspect(params)}")

    {:ok, address_type} = Customers.create_address_type(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: address_type.id,
      address_type: address_type.address_type
    })
  end
end
