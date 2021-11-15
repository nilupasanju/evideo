defmodule Evideo.Customers do
  alias Evideo.Repo
  alias Evideo.Customers.Customer

  def create_customer(attrs) do
    %Customer{}
    |> Customer.changeset(attrs)
    |> Repo.insert()
  end

  def get_customer(id) do
    Repo.get(Customer, id)
  end

  def update_customer(id, attrs) do
    case get_customer(id) do
      nil ->
        {:error, :not_found}

      customer ->
        customer
        |> Customer.changeset(attrs)
        |> Repo.update()
    end
  end

  def list_customers() do
    Repo.all(Customer)
  end

  def delete_customer(id) do
    Repo.get!(Customer, id) |> Repo.delete!
  end
end
