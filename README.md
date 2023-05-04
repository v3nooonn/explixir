# Explixir

Experimental Elixir.

The experimental repo for Elixir and Phoenix.
Which including:
- Project initialization.
- Phoenix applications within the structure of umbrella

### Project Initialization
```zsh
# pwd: ../TARGET
mix new TARGET --app explixir --umbrella
# pwd: ./explixir
mix new . --app explixir --umbrella
```

### Phoenix Web Application
1. Applications init
```zsh
# Notes:
# 1. Mix requires the directory to match the application name for umbrella apps.
# 2. An error occurred: (Mix) Formatter plugin Phoenix.LiveView.HTMLFormatter cannot be found
#   Remove the plugins in `.formatter.exs` file in project root path.

# Creates a new Ecto project within an umbrella project.
# The name of the dir, application name should the same as mentioned above,
#   as for the module name, looks like as we want.
mix phx.new.ecto org --app org --module OrgEcto
# Creates a new Phoenix web API project within an umbrella project.
mix phx.new.web bff --app bff --module BFFView --no-html --no-assets --no-esbuild --no-mailer --no-ecto --no-tailwind --no-gettext --no-dashboard
# Not suer about the diff between those two creations
mix phx.new bff --app bff --module BFFView --no-install --no-html --database postgres --no-live --no-assets --no-dashboard --no-mailer
```

2. Dependency claim
```elixir
# In explixir/apps/bff/mix.exs
# Add two lines below:
  ...
  {:hackney, "~> 1.9"},
  {:org, in_umbrella: true}
```

### Postgres Migration
1. Generation
```zsh
mix ecto.gen.migration init
```
2. Execution
```zsh
mix ecto.migrate
```