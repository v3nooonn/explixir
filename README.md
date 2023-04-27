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
```

### Phoenix Application
```zsh
mix phx.new.web bff --no-assets # Creates a new Phoenix web project within an umbrella project
mix phx.new.ecto org            # Creates a new Ecto project within an umbrella project
```
#### Further Conduction
1. Ecto
```zsh
We are almost there! The following steps are missing:

    $ cd orgs

Then configure your database in config/dev.exs and run:

    $ mix ecto.create

You can run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix
```

2. BFF
```zsh
We are almost there! The following steps are missing:

    $ cd bff

Your web app requires a PubSub server to be running.
The PubSub server is typically defined in a `mix phx.new.ecto` app.
If you don't plan to define an Ecto app, you must explicitly start
the PubSub in your supervision tree as:

    {Phoenix.PubSub, name: Bff.PubSub}

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
```