defmodule OrgService.Repo.Migrations.Init do
  use Ecto.Migration

  def change do
    create table(:organization) do
      add :name, :string, null: false
      add :domain, :string, dnull: false
      add :description, :string, dnull: false

      timestamps()
    end

    create table(:organization_attribute) do
      add :org_id, references(:organization)
      add :home, :string, null: false
      add :avatar, :string, null: false
      add :version, :string, null: false

      timestamps()
    end
  end
end
