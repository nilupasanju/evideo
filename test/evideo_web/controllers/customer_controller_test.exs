defmodule EvideoWeb.CustomerControllerTest do
  use ExUnit.Case
  use EvideoWeb.ConnCase
  alias EvideoWeb.CustomerController

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Evido"
  end

  #describe "create/2" do
  #  test "return create when username empty" do
  #    assert CustomerController.create(_conn,%{username: ""}) == "Username Empty"
  #  end
  #end

  @params %{
    email: "user@example.com",
    name: "abc",
    phone: "0912232432",
    no_of_rented_copies: "",
    username: "username",
    password: "password",
    password_confirmation: "password"
  }
  test "POST /customers", %{conn: conn} do
    conn = post conn, "/customers", [customer: @params]

    assert redirected_to(conn) == "/"
    assert get_flash(conn, :info) == "You have successfully signed up!"

  end
end
