defmodule OrgService.Org.Organization do
  use OrgService.EctoData

  @type t :: %__MODULE__{}

  schema "organization" do
    field :name, :string
    field :domain, :string
    field :description, :string

    has_many :attributes, OrgService.Org.Attribute
  end
end
