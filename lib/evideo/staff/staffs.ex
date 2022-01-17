defmodule Evideo.Staffs do
  alias Evideo.Repo
  alias Evideo.Staffs.Staff


  def create_staff(attrs) do
    %Staff{}
    |> Staff.changeset(attrs)
    |> Repo.insert()
  end

  def get_staff(id) do
    Repo.get(Staff, id)
  end

  def update_staff(id, attrs) do
    case get_staff(id) do
      nil ->
        {:error, :not_found}

      staff ->
        staff
        |> Staff.changeset(attrs)
        |> Repo.update()
    end
  end

  def list_staff() do
    Repo.all(Staff)
  end

  def delete_staff(id) do
    Repo.get!(Staff, id) |> Repo.delete!()
  end

end
