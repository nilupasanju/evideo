defmodule Evideo.Customers do
  alias Evideo.Repo
  alias Evideo.Customers.{Customer, Country, State, City, Enquiry, AddressType}

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

  # State
  def create_state(attrs) do
    %State{}
    |> State.changeset(attrs)
    |> Repo.insert()
  end

  def get_state(id) do
    Repo.get(State, id)
  end

  def update_state(id, attrs) do
    case get_state(id) do
      nil ->
        {:error, :not_found}

      customer ->
        customer
        |> State.changeset(attrs)
        |> Repo.update()
    end
  end

  def list_states() do
    Repo.all(State)
  end

  def delete_state(id) do
    Repo.get!(State, id) |> Repo.delete!()
  end

  # Cities
  def create_city(attrs) do
    %City{}
    |> City.changeset(attrs)
    |> Repo.insert()
  end

  def get_city(id) do
    Repo.get(City, id)
  end

  def update_city(id, attrs) do
    case get_city(id) do
      nil ->
        {:error, :not_found}

      city ->
        city
        |> City.changeset(attrs)
        |> Repo.update()
    end
  end

  def list_cities() do
    Repo.all(City)
  end

  def delete_city(id) do
    Repo.get!(City, id) |> Repo.delete!()
  end

  # Enquiry
  def create_enquiry(attrs) do
    %Enquiry{}
    |> Enquiry.changeset(attrs)
    |> Repo.insert()
  end

  def list_enquiry() do
    Repo.all(Enquiry)
  end

  # Addess_type
  def create_address_type(attrs) do
    %AddressType{}
    |> AddressType.changeset(attrs)
    |> Repo.insert()
  end

  def list_address_types() do
    Repo.all(AddressType)
  end
end
