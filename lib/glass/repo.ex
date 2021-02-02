defmodule Glass.Repo do
  use Ecto.Repo,
    otp_app: :glass,
    adapter: Ecto.Adapters.Postgres
end
