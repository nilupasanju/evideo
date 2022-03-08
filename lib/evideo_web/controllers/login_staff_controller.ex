defmodule EvideoWeb.LoginStaffController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Staffs.LoginStaffs

  def get_all(conn, _params) do
    login_staffs =
      LoginStaffs.list_login_staffs()
      |> Enum.map(fn login_staff ->
        %{
          id: login_staff.id,
          first_name: login_staff.first_name,
          last_name: login_staff.last_name
        }
      end)

    Logger.info("Staffs #{inspect(login_staffs)}")

    conn
    |> put_status(:ok)
    |> json(login_staffs)
  end

  def create(conn, params) do
    Logger.info("creating staffs with params #{inspect(params)}")

    {:ok, login_staff} = LoginStaffs.create_login_staff(params)

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
    Logger.info("Updating staff with params #{inspect(params)}")

    {:ok, login_staff} = LoginStaffs.update_login_staff(id, params)

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
    Logger.info("Delete staff with params #{inspect(params)}")
    {:ok, login_staff} = LoginStaffs.delete_login_staff(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: login_staff.id
    })
  end

  def get(conn, %{"id" => id} = params) do
    {:ok, login_staff} = LoginStaffs.get_login_staff(id)
    Logger.info("Staff #{inspect(params)}")

    conn
    |> put_status(:ok)
    |> json(%{
      id: login_staff.id,
      first_name: login_staff.first_name
    })
  end
end
