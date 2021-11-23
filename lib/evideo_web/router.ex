defmodule EvideoWeb.Router do
  use EvideoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {EvideoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EvideoWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", EvideoWeb do
    pipe_through :api

    get "/customers", CustomerController, :get_all
    post "/customers/", CustomerController, :create
    put "/customers/:id", CustomerController, :update
    delete "/customers/:id", CustomerController, :delete

    get "/movies", MovieController, :get_all
    post "/movies/", MovieController, :create
    put "/movies/:id", MovieController, :update
    delete "/movies/:id", MovieController, :delete

    get "/countries", CountryController, :get_all
    post "/countries/", CountryController, :create
    put "/countries/:id", CountryController, :update
    delete "/countries/:id", CountryController, :delete
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: EvideoWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
