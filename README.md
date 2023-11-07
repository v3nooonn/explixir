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

3. Create Phx Context
```shell
mix phx.gen.context Context Entity Table
```
- Context: the file name of hte context, The module name could be renamed like xxxx.Service/xxx.Context
- Entity: the closely related entity under the context/service
- Table: the table name and the schema name

```shell
mix phx.gen.context Shippo Transaction shippo_transactions object_id:string:unique shipment_date:utc_datetime_usec eta:utc_datetime_usec order_id:string parcel_id:string rate_id:string tracking_number:string tracking_status:string tracking_url_provider:string label_url:text metadata:string length:float width:float height:float distance_unit:enum:cm:in:ft:m:mm:yd pound:integer ounce:float

output:
* creating lib/zero/shippos/transaction.ex
* creating priv/repo/migrations/20230518070345_create_shippo_transaction.exs
* creating lib/zero/shippos.ex
* injecting lib/zero/shippos.ex
* creating test/zero/shippos_test.exs
* injecting test/zero/shippos_test.exs
* creating test/support/fixtures/shippos_fixtures.ex
* injecting test/support/fixtures/shippos_fixtures.ex

Some of the generated database columns are unique. Please provide
unique implementations for the following fixture function(s) in
test/support/fixtures/shippos_fixtures.ex:

    def unique_transaction_unique_tx_id do
      raise "implement the logic to generate a unique transaction unique_tx_id"
    end


Remember to update your repository by running migrations:

    $ mix ecto.migrate

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