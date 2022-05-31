defmodule EvideoWeb.StaffController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Staffs

  def get_all(conn, _params) do
    staffs =
      Staffs.list_staff()
      |> Enum.map(fn staff ->
        %{
          id: staff.id,
          login_id: staff.login_id,
          phone: staff.phone,
          email: staff.email,
          gender: staff.gender,
          wage: staff.wage
        }
      end)

    Logger.info("Staffs #{inspect(staffs)}")

    conn
    |> put_status(:ok)
    |> json(staffs)
  end

  def create(conn, params) do
    {:ok, staff} = Staffs.create_staff(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: staff.id,
      login_id: staff.login_id,
      phone: staff.phone,
      email: staff.email,
      gender: staff.gender,
      wage: staff.wage
    })
  end

  def update(conn, %{"id" => id} = params) do
    {:ok, staff} = Staffs.update_staff(id, params)

    conn
    |> put_status(:ok)
    |> json(%{
      id: staff.id,
      login_id: staff.login_id,
      phone: staff.phone,
      email: staff.email,
      gender: staff.gender,
      wage: staff.wage
    })
  end

  def delete(conn, %{"id" => id} = params) do
    staff = Staffs.delete_staff(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: staff.id
    })
  end

  def get(conn, %{"id" => id} = params) do
    staff = Staffs.get_staff(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: staff.id,
      login_id: staff.login_id,
      phone: staff.phone,
      email: staff.email,
      gender: staff.gender,
      wage: staff.wage
    })
  end
end
