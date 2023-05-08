defmodule :"Elixir.OrgService.Repo.Migrations.Up-down-testing" do
  use Ecto.Migration

  def up do
    create table(:organization_updown) do
      add :name, :string, null: false
      add :domain, :string, dnull: false
      add :description, :string, dnull: false

      timestamps()
    end
  end

  def down do
    drop table(:organization_updown)
  end
end
