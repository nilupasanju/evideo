defmodule Evideo.Movies do
  alias Evideo.Repo
  alias Evideo.Movies.Movie

  def create_movie(attrs) do
    %Movie{}
    |> Movie.changeset(attrs)
    |> Repo.insert()
  end

  def get_movie(id) do
    Repo.get(Movie, id)
  end

  def update_movie(id, attrs) do
    case get_movie(id) do
      nil ->
        {:error, :not_found}

      movie ->
        movie
        |> Movie.changeset(attrs)
        |> Repo.update()
    end
  end

  def list_movies() do
    Repo.all(Movie)
  end

  def delete_movie(id) do
    Repo.get!(Movie, id) |> Repo.delete!()
  end

  # genre
  def create_genre(attrs) do
    %Movie{}
    |> Movie.changeset(attrs)
    |> Repo.insert()
  end

  def get_genre(id) do
    Repo.get(Movie, id)
  end

  def update_genre(id, attrs) do
    case get_movie(id) do
      nil ->
        {:error, :not_found}

      movie ->
        movie
        |> Movie.changeset(attrs)
        |> Repo.update()
    end
  end

  def list_genre() do
    Repo.all(Movie)
  end

  def delete_genre(id) do
    Repo.get!(Movie, id) |> Repo.delete!()
  end
end
