defmodule OrgService.ServiceContext do
  @moduledoc """
  The Service context of the OrgService
  """

  import Ecto.Query, warn: false

  alias OrgService.Repo

  alias OrgService.Org.Organization, as: Org
  alias OrgService.Org.Attribute, as: Attr

  @doc """
  Find organization basic info by ID
  """
  def find(id) do
    ids = id |> Enum.uniq()

    Org
    |> where([u], u.id in ^ids)
    |> Repo.all()
    |> Map.new(&{&1.id, &1})
  end

  @doc """
  Find organization with attributes by ID
  """
  def findWith(id, true) do
    ids = id |> Enum.uniq()
  end
end
