defmodule DefeatTheLoan.Router do
  use DefeatTheLoan.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DefeatTheLoan do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/recommendations", RecommendationController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", DefeatTheLoan do
  #   pipe_through :api
  # end
end
