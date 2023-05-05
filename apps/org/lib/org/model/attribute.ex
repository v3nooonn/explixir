defmodule OrgService.Org.Model.Attribute do
  use OrgService.EctoRelated

  #  @derive {Swoosh.Email.Recipient, address: :email}
  #  @derive {Inspect, except: [:password]}
  #  @derive {Jason.Encoder, except: [:description]}

  @type t :: %__MODULE__{}

  schema "organization_attribute" do
    field :home, :string
    field :avatar, :string
    field :version, :string

    belongs_to :organization, OrgService.Org.Model.Organization, foreign_key: :org_id
  end

  def changeset(attribute, attrs) do
    attribute
    |> cast(attrs, [:org_id, :name, :avatar, :version])
    |> validate_required([:org_id, :name, :domain, :description])
  end
end
