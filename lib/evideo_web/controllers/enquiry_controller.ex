defmodule EvideoWeb.EnquiryController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Customers

  def get_all(conn, _params) do
    enquiry =
      Customers.list_enquiry()
      |> Enum.map(fn enquiry ->
        %{
          id: enquiry.id,
          email: enquiry.email,
          name: enquiry.name,
          phone: enquiry.phone,
          enquiry: enquiry.enquiry
        }
      end)

    Logger.info("Enquiries #{inspect(enquiry)}")

    conn
    |> put_status(:ok)
    |> json(enquiry)
  end

  def create(conn, params) do
    Logger.info("creating enquiry with params #{inspect(params)}")

    {:ok, enquiry} = Customers.create_enquiry(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: enquiry.id,
      email: enquiry.email,
      name: enquiry.name,
      phone: enquiry.phone,
      enquiry: enquiry.enquiry
    })
  end
end
