defmodule BFFView.Router do
  use BFFView, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BFFView do
    pipe_through :api
  end
end
