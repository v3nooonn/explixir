defmodule OrgService.ServiceContext do
  @moduledoc """
  The Service Context of the OrgService
  """

  use OrgService.EctoRelated

  require Logger

  alias OrgService.Repo

  alias OrgService.Org.Model.Organization, as: Org
  alias OrgService.Org.Model.Attribute, as: Attr

  @default_preloads []

  @doc """
  Find organization basic info by ID
  """
  def find(_, id) do
    case Repo.find_by_id(Org, id, @default_preloads) do
      {:ok, record} ->
        {:ok, %{id: record.id(), name: record.name(), description: record.description()}}

      {:error, :not_found} ->
        {:error, :not_found}
    end
  end

  @doc """
  Find organization basic info with associations by ID
  """
  def find_preload(_, id, preloads) do
    case Repo.find_by_id(Org, id, preloads) do
      {:ok, record} ->
        Map.get(record, :attributes)
        |> Enum.map(fn item ->
          %{attributes_id: item.id, home: item.home, avatar: item.avatar, version: item.version}
        end)

        {
          :ok,
          %{
            id: record.id(),
            name: record.name(),
            description: record.description(),
            attributes:
              Map.get(record, :attributes)
              |> Enum.map(fn item ->
                %{
                  attributes_id: item.id,
                  home: item.home,
                  avatar: item.avatar,
                  version: item.version
                }
              end)
          }
        }

      {:error, :not_found} ->
        {:error, :not_found}
    end
  end
end
