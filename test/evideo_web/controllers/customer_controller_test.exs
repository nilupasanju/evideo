defmodule EvideoWeb.CustomerControllerTest do
  use ExUnit.Case
  use EvideoWeb.ConnCase
  alias EvideoWeb.CustomerController
  alias Customer.{Customer, Repo}

  # test "GET /", %{conn: conn} do
  #  conn = get(conn, "/")
  #  assert html_response(conn, 200) =~ "Welcome to Evido"
  # end

  # describe "create/2" do
  #  test "return create when username empty" do
  #    assert CustomerController.create(_conn,%{username: ""}) == "Username Empty"
  #  end
  # end

  @params %{
    email: "user@example.com",
    name: "abc",
    phone: 912_232_432,
    no_of_rented_copies: 1,
    username: "username",
    password: "password"
  }
  describe "create" do
    test "Create customer", %{conn: conn} do
      conn = post(conn, "/api/customers", @params)

      assert %{
               "customer_password" => nil,
               "email" => "user@example.com",
               "id" => _,
               "name" => "abc",
               "no_of_rented_copies" => 1,
               "phone" => 912_232_432,
               "username" => "username"
             } = json_response(conn, 201)
    end
  end

  describe "update" do
    test "Update customer not found", %{conn: conn} do
      conn = put(conn, "/api/customers/0", @params)

      assert %{} = json_response(conn, 404)
    end

    test "Update Success", %{conn: conn} do
      {ok, customer} = fixture()
      conn = put(conn, "/api/customers/#{customer.id}")

      assert json_response(conn, 200)
    end
  end

  describe "get" do
    test "Get all customers", %{conn: conn} do
      conn = get(conn, "/api/customers")

      IO.puts("list:- #{inspect(conn)}")

      assert [] = json_response(conn, 200)
    end
  end

  describe "delete" do
    test "delete customer ", %{conn: conn} do
      {ok, customer} = fixture()
      conn = delete(conn, "/api/customers/#{customer.id}")

      assert json_response(conn, 200)
    end
  end

  defp fixture() do
    Evideo.Customers.create_customer(@params)
  end
end
