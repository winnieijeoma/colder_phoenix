defmodule Colder.Repo do
  use Ecto.Repo,
    otp_app: :colder,
    adapter: Ecto.Adapters.Postgres
end
