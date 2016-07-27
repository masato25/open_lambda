defmodule OpenLambda.Router do
  use OpenLambda.Web, :router

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

  scope "/", OpenLambda do
    pipe_through :browser # Use the default browser stack

    get "/endpoints", EndpointsController, :index
    get "/query_endpoints", EndpointsController, :query_endpoints
    get "/query_counter", EndpointsController, :query_counter
  end

  # Other scopes may use custom stacks.
  # scope "/api", OpenLambda do
  #   pipe_through :api
  # end
end
