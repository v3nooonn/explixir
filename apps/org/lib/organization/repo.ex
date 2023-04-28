defmodule OrgEcto.Repo do
  use Ecto.Repo,
    otp_app: :organization,
    adapter: Ecto.Adapters.Postgres
end
