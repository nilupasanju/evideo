defmodule Evideo.Staffs.LoginStaffs do
  alias Evideo.Repo
  # alias Evideo.Staffs.Staff
  alias Evideo.Staffs.LoginStaff
  alias Evideo.Staffs.Roles

  def create_login_staff(attrs) do
    %LoginStaff{}
    |> LoginStaff.changeset(attrs)
    |> Repo.insert()
  end

  def get_login_staff(id) do
    Repo.get(LoginStaff, id)
  end

  def update_login_staff(id, attrs) do
    case get_login_staff(id) do
      nil ->
        {:error, :not_found}

      login_staff ->
        login_staff
        |> LoginStaff.changeset(attrs)
        |> Repo.update()
    end
  end

  def list_login_staffs() do
    Repo.all(LoginStaff)
  end

  def delete_login_staff(id) do
    Repo.get!(LoginStaff, id) |> Repo.delete!()
  end

  #roles
  def create_role(attrs) do
    %Roles{}
    |> Roles.changeset(attrs)
    |> Repo.insert()
  end

  def get_role(id) do
    Repo.get(Roles, id)
  end

  def update_role(id, attrs) do
    case get_role(id) do
      nil ->
        {:error, :not_found}

      role ->
        role
        |> Roles.changeset(attrs)
        |> Repo.update()
    end
  end

  def list_roles() do
    Repo.all(Roles)
  end

  def delete_role(id) do
    Repo.get!(Roles, id) |> Repo.delete!()
  end
end
