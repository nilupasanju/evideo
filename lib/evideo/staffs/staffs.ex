defmodule Evideo.Staffs do
  alias Evideo.Repo
  # alias Evideo.Staffs.Staff
  alias Evideo.Staffs.LoginStaff

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
end
