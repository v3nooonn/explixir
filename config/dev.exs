import Config

# Configure your database
config :organization, OrgEcto.Repo,
  username: "pgadmin",
  password: "pgadmin",
  hostname: "localhost",
  database: "organization",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
