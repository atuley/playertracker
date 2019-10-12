defmodule PlayertrackerWeb.Router do
  use PlayertrackerWeb, :router

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

  pipeline :authenticated do
    plug Playertracker.Guardian.AuthPipeline
    plug PlayertrackerWeb.Plugs.CurrentUser
  end

  scope "/", PlayertrackerWeb do
    pipe_through :browser
    pipe_through :authenticated

    get "/sessions/new", SessionController, :new
    post "/sessions", SessionController, :create
    get "/logout", SessionController, :logout
    resources "/users", UserController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PlayertrackerWeb do
  #   pipe_through :api
  # end
end
