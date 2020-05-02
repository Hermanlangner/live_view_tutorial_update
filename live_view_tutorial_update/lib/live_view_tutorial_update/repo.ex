defmodule MyApp.Repo do
  use Ecto.Repo,
    otp_app: :live_view_tutorial_update,
    adapter: Ecto.Adapters.Postgres
end
