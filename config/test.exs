import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :organization, OrgEcto.Repo,
#  database: "organization_test#{System.get_env("MIX_TEST_PARTITION")}",
  username: "pgadmin",
  password: "pgadmin",
  hostname: "localhost",
  database: "organization",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
