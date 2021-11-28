defmodule Evideo.Customers do
  alias Evideo.Repo
  alias Evideo.Customers.Customer
  alias Evideo.Customers.Country

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
    Repo.get!(Customer, id) |> Repo.delete!()
  end

  # Country
  def create_country(attrs) do
    %Country{}
    |> Country.changeset(attrs)
    |> Repo.insert()
  end

  def get_country(id) do
    Repo.get(Country, id)
  end

  def update_country(id, attrs) do
    case get_country(id) do
      nil ->
        {:error, :not_found}

      customer ->
        customer
        |> Country.changeset(attrs)
        |> Repo.update()
    end
  end

  def list_countries() do
    Repo.all(Country)
  end

  def delete_country(id) do
    Repo.get!(Country, id) |> Repo.delete!()
  end
end
