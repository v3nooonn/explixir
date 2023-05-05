defmodule OrgService.Org.Model.Organization do
  use OrgService.EctoRelated

  #  @derive {Swoosh.Email.Recipient, address: :email}
  #  @derive {Inspect, except: [:password]}
  #  @derive {Jason.Encoder, except: [:description]}

  @type t :: %__MODULE__{}

  schema "organization" do
    field :name, :string
    field :domain, :string
    field :description, :string

    has_many :attributes, OrgService.Org.Model.Attribute, foreign_key: :org_id
  end

  def changeset(org, attrs) do
    org
    |> cast(attrs, [:name, :domain, :description])
    |> validate_required([:name, :domain, :description])
  end
end
