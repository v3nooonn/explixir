# OrgService

## Layout
```elixir
├── README.md
├── lib
│   ├── org
│   │   ├── application.ex
│   │   ├── ecto_related.ex
│   │   ├── model
│   │   │   ├── attribute.ex
│   │   │   └── organization.ex
│   │   ├── repo_operation.ex
│   │   └── service_context.ex
│   └── org.ex
├── mix.exs
├── priv
│   └── repo
│       ├── migrations
│       │   └── 20230504120530_init.exs
│       └── seeds.exs
└── test
    ├── support
    │   └── data_case.ex
    └── test_helper.exs
```

## DB Migrations

1. It's better to define both `up` and `down` in migration.
2. `mix ecto.migrations`

    All executed migrations currently.
    ```text
          Status    Migration ID    Migration Name
        --------------------------------------------------
          up        20230504120530  init
    ```
3. `mix ecto.migrate` & `mix ecto.migrations`
    ```text
          Status    Migration ID    Migration Name
        --------------------------------------------------
          up        20230504120530  init
          up        20230508115835  up-down-testing
    ```

4. `mix ecto.rollback` & `mix ecto.migrations`
    ```text
      Status    Migration ID    Migration Name
    --------------------------------------------------
      up        20230504120530  init
      down      20230508115835  up-down-testing
    ```