defmodule EvideoWeb.StateController do
  use EvideoWeb, :controller

  require Logger

  alias Evideo.Customers

  def get_all(conn, _params) do
    states =
      Customers.list_states()
      |> Enum.map(fn states ->
        %{
          id: states.id,
          state_name: states.state_name
        }
      end)

    Logger.info("States #{inspect(states)}")

    conn
    |> put_status(:ok)
    |> json(states)
  end

  def create(conn, params) do
    Logger.info("creating state with params #{inspect(params)}")

    {:ok, states} = Customers.create_state(params)

    conn
    |> put_status(:created)
    |> json(%{
      id: states.id,
      state_name: states.state_name
    })
  end

  def update(conn, %{"id" => id} = params) do
    Logger.info("Updating state with params #{inspect(params)}")

    {:ok, states} = Customers.update_state(id, params)

    conn
    |> put_status(:ok)
    |> json(%{
      id: states.id,
      state_name: states.state_name
    })
  end

  def delete(conn, %{"id" => id} = params) do
    Logger.info("Delete state with params #{inspect(params)}")
    {:ok, states} = Customers.delete_state(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: states.id
    })
  end

  def get(conn, %{"id" => id} = params) do
    states = Customers.get_state(id)

    conn
    |> put_status(:ok)
    |> json(%{
      id: states.id,
      country_id: states.country_id,
      state_name: states.state_name
    })
  end
end
