
defmodule EvideoWeb.MovieController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Movies


  def get_all(conn, _params) do
    movies = Movies.list_movies() |> Enum.map(fn movie ->
      %{
        id: movie.id,
        title: movie.title,
        year: movie.year,
        description: movie.description,
        length: movie.length,
        daily_price: movie.daily_price,
        obselete: movie.obselete

      }
    end)
    Logger.info("movies #{inspect(movies)}")

    conn
    |> put_status(:ok)
    |> json(movies)
  end

  def create(conn, params) do
    Logger.info("creating movie with params #{inspect(params)}")

    {:ok, movie} = Movies.create_movie(params)
    conn
    |> put_status(:created)
    |> json(
      %{
        id: movie.id,
        title: movie.title,
        year: movie.year,
        description: movie.description,
        length: movie.length,
        daily_price: movie.daily_price,
        obselete: movie.obselete
      }
    )
  end

  def update(conn, %{"id" => id} = params) do
    Logger.info("Updating movier with params #{inspect(params)}")

    {:ok, movie} = Movies.update_movie(id, params)
    conn
    |> put_status(:ok)
    |> json(
      %{
        id: movie.id,
        title: movie.title,
        year: movie.year,
        description: movie.description,
        length: movie.length,
        daily_price: movie.daily_price,
        obselete: movie.obselete
      }
    )
  end

  def delete(conn, %{"id" => id} = params) do
    Logger.info("Delete movie with params #{inspect(params)}")
    {:ok, movie} = Movies.delete_movie(id)
    conn
    |> put_status(:ok)
    |> json(%{
      id: movie.id
    })
  end
end
