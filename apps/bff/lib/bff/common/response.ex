defmodule Response do
  use BFFView, :controller

  defmodule Error do
    def not_found(conn, id) do
      conn
      |> put_resp_content_type("application/json", "charset=utf-8")
      |> put_status(:not_found)
      |> json(%{error: %{msg: "failed", details: "invalid id: #{id}"}})
      |> halt()
    end
  end

  defmodule Success do
    def success(conn, result) do
      conn
      |> put_resp_content_type("application/json", "charset=utf-8")
      |> put_status(:ok)
      |> json(%{msg: "ok", data: result})
    end
  end
end
