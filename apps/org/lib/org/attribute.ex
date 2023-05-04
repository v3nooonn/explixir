defmodule OrgService.Org.Attribute do
  use OrgService.EctoData

  @type t :: %__MODULE__{}

  schema "organization_attribute" do
    field :home, :string
    field :avatar, :string
    field :version, :string

    belongs_to :organization, OrgService.Org.Organization
  end
end
