defmodule BFFView.Router do
  use BFFView, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/explixir", BFFView do
    pipe_through :api
    get "/:org_id", Controllers.Explixir, :find
    get "/:org_id/preload", Controllers.Explixir, :find_preload
  end
end
