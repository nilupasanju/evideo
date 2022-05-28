defmodule EvideoWeb.RolesController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.LoginStaffs

  def get_all(conn, _params) do
    roles = LoginStaffs.list_roles()

    Enum.map(roles, fn role ->
      %{
        id: role.id,
        roles_description: role.roles_description
      }
    end)

    # Roles =
    #   LoginStaffs.list_roles()
    #  |> Enum.map(fn role ->
    #    %{
    #      id: role.id,
    #      roles_description: roles.roles_description
    #    }
    #  end)

    Logger.info("roles #{inspect(roles)}")

    conn
    |> put_status(:ok)
    |> json(roles)
  end

  def create(conn, params) do
    Logger.info("creating role with params #{inspect(params)}")

    {:ok, role} = LoginStaffs.create_role(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: role.id,
      roles_description: role.roles_description
    })
  end

  def update(conn, %{"id" => id} = params) do
    Logger.info("Updating role with params #{inspect(params)}")

    {:ok, role} = LoginStaffs.update_role(id, params)

    conn
    |> put_status(:ok)
    |> json(%{
      id: role.id,
      roles_description: role.roles_description
    })
  end

  def delete(conn, %{"id" => id} = params) do
    Logger.info("Delete role with params #{inspect(params)}")
    {:ok, role} = LoginStaffs.delete_role(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: role.id
    })
  end
end
