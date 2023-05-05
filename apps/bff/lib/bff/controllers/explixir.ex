defmodule BFFView.Controllers.Explixir do
  use BFFView, :controller

  require Logger

  alias Response, as: Response
  alias OrgService.ServiceContext, as: OrgService
  #  alias OrgService.Org.Model.Organization, as: Organization
  #  alias OrgService.Org.Model.Attribute, as: Attribute

  @attr_preload [:attributes]

  def find(conn, %{"org_id" => id}) do
    case OrgService.find(conn, id) do
      {:ok, record} ->
        conn
        |> Response.Success.success(record)

      {:error, :not_found} ->
        conn
        |> Response.Error.not_found(id)
    end
  end

  def find_preload(conn, %{"org_id" => id}) do
    case OrgService.find_preload(conn, id, @attr_preload) do
      {:ok, record} ->
        conn
        |> Response.Success.success(record)

      {:error, :not_found} ->
        conn
        |> Response.Error.not_found(id)
    end
  end
end
