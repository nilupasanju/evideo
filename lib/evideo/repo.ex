defmodule Evideo.Repo do
  use Ecto.Repo,
    otp_app: :evideo,
    adapter: Ecto.Adapters.Postgres
end
