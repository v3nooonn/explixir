# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :bff,
  namespace: BFFView,
  generators: [context_app: false]

# Configures the endpoint
config :bff, BFFView.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: BFFView.ErrorJSON],
    layout: false
  ],
  pubsub_server: BFFView.PubSub,
  live_view: [signing_salt: "53jrSKsq"]

# Configure Mix tasks and generators
config :org,
  namespace: OrgService,
  ecto_repos: [OrgService.Repo]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :org, OrgService.Mailer, adapter: Swoosh.Adapters.Local

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
# Configures Elixir's Logger
config :logger, :console,
  format: "$date $time [$level] $metadata$message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
