import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bff, BffEnd.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zRVEpFUjNCosupya6LGt15Owej/p5O3LBdkYAQGQiAKRbZCBarWASYQzWEJBpKLc",
  server: false

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :org, OrgEcto.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "org_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10
