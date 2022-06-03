defmodule EvideoWeb.RolesController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Staffs

  def get_all(conn, _params) do
    roles =
      Staffs.list_roles()
      |> Enum.map(fn role ->
        %{
          id: role.id,
          roles_description: role.roles_description
        }
      end)

    conn
    |> put_status(:ok)
    |> json(roles)
  end

  def get(conn, %{"id" => id} = params) do
    role = Staffs.get_role(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: role.id,
      roles_description: role.roles_description
    })
  end

  def create(conn, params) do
    {:ok, role} = Staffs.create_role(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: role.id,
      roles_description: role.roles_description
    })
  end

  def update(conn, %{"id" => id} = params) do
    {:ok, role} = Staffs.update_role(id, params)

    conn
    |> put_status(:ok)
    |> json(%{
      id: role.id,
      roles_description: role.roles_description
    })
  end

  def delete(conn, %{"id" => id} = params) do
    role = Staffs.delete_role(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: role.id
    })
  end
end
