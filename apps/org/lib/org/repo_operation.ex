defmodule OrgService.Repo do
  use Ecto.Repo,
    otp_app: :org,
    adapter: Ecto.Adapters.Postgres

  # -------------------------------------------------------------------
  # Types

  @default_preloads []

  @type id :: Ecto.UUID.t()
  @type changeset :: Ecto.Changeset.t()

  @typedoc "A database error"
  @type error :: {:error, changeset() | :not_found | :unauthorized}

  @typedoc "The result of a successful database operation"
  @type success(schema_type) :: {:ok, schema_type}

  @typedoc "The full return type of the database change operation (i.e., insert, update, delete)"
  @type result(schema_type) :: success(schema_type) | error()

  @typedoc "The equivalent of `%module{}` for the struct defined in `module`"
  @type typed_struct(mod) :: %{:__struct__ => mod, optional(atom()) => any()}

  @typedoc "The full return type of the database find operation"
  @type find_result(mod) :: success(typed_struct(mod)) | error()

  # -------------------------------------------------------------------
  # functions

  @spec find_by_id(mod, id(), any()) :: find_result(mod)
        when mod: module()
  def find_by_id(module, id, preloads \\ @default_preloads) do
    module
    # TODO: is this the get of Repo? If so, how about Repo.get(id)?
    |> get(id)
    |> preload(preloads)
    |> handle_get_result()
  end

  defp handle_get_result(nil), do: {:error, :not_found}
  defp handle_get_result(record), do: {:ok, record}
end
