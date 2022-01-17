defmodule EvideoWeb.StaffController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Staffs

  def get_all(conn, _params) do
    staffs =
      Staffs.list_staff()
      |> Enum.map(fn staff->
        %{
          id: staff.id,
          first_name: staff.first_name,
          last_name: staff.last_name
        }
      end)

    Logger.info("Staffs #{inspect(staffs)}")

    conn
    |> put_status(:ok)
    |> json(staffs)
  end

  def create(conn, params) do
    Logger.info("creating staffs with params #{inspect(params)}")

    {:ok, staff} = Staffs.create_staff(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: staff.id,
      first_name: staff.first_name,
      last_name: staff.last_name,
      username: staff.username,
      password: staff.loginpassword
    })
  end

  def update(conn, %{"id" => id} = params) do
    Logger.info("Updating staff with params #{inspect(params)}")

    {:ok, staff} = Staffs.update_staff(id, params)

    conn
    |> put_status(:ok)
    |> json(%{
      id: staff.id,
      first_name: staff.first_name,
      last_name: staff.last_name,
      username: staff.username,
      password: staff.loginpassword
    })
  end

  def delete(conn, %{"id" => id} = params) do
    Logger.info("Delete staff with params #{inspect(params)}")
    {:ok, staff} = Staffs.delete_staff(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: staff.id
    })
  end

  def get(conn, %{"id" => id} = params) do
    {:ok, staff} = Staffs.get_staff(id)
    Logger.info("Staff #{inspect(params)}")

    conn
    |> put_status(:ok)
    |> json(%{
      id: staff.id,
      first_name: staff.first_name

    })
  end
end
