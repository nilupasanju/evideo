defmodule EvideoWeb.LoginStaffController do
  use EvideoWeb, :controller
  alias Evideo.Staffs

  def get_all(conn, _params) do
    login_staffs =
      Staffs.list_login_staffs()
      |> Enum.map(fn login_staff ->
        %{
          id: login_staff.id,
          first_name: login_staff.first_name,
          last_name: login_staff.last_name
        }
      end)

    conn
    |> put_status(:ok)
    |> json(login_staffs)
  end

  def create(conn, params) do
    {:ok, login_staff} = Staffs.create_login_staff(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: login_staff.id,
      first_name: login_staff.first_name,
      last_name: login_staff.last_name,
      username: login_staff.username,
      password: login_staff.loginpassword
    })
  end

  def update(conn, %{"id" => id} = params) do
    {:ok, login_staff} = Staffs.update_login_staff(id, params)

    conn
    |> put_status(:ok)
    |> json(%{
      id: login_staff.id,
      first_name: login_staff.first_name,
      last_name: login_staff.last_name,
      username: login_staff.username,
      password: login_staff.loginpassword
    })
  end

  def delete(conn, %{"id" => id} = params) do
    login_staff = Staffs.delete_login_staff(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: login_staff.id
    })
  end

  def get(conn, %{"id" => id} = params) do
    login_staff = Staffs.get_login_staff(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: login_staff.id,
      first_name: login_staff.first_name
    })
  end
end
