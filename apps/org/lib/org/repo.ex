defmodule OrgService.Repo do
  use Ecto.Repo,
    otp_app: :org,
    adapter: Ecto.Adapters.Postgres
end
