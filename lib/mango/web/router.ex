defmodule Mango.Web.Router do
  use Mango.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :frontend  do
    plug Mango.Web.Plugs.LoadCustomer
    plug Mango.Web.Plugs.FetchCart
    plug Mango.Web.Plugs.Locale
  end

  pipeline :admin do
    plug Mango.Web.Plugs.AdminLayout
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Mango.Web do
    pipe_through [:browser, :frontend]

    # Add all routes that don't require authentication
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create

    get "/", PageController, :index
    get "/categories/:name", CategoryController, :show

    get "/cart", CartController, :show
    post "/cart", CartController, :add
    put "/cart", CartController, :update
  end

  scope "/", Mango.Web do
    pipe_through [:browser, :frontend, Mango.Web.Plugs.AuthenticateCustomer]

    # Add all routes that require authentication
    get "/logout", SessionController, :delete
    get "/checkout", CheckoutController, :edit
    put "/checkout/confirm", CheckoutController, :update
    resources "/tickets", TicketController, except: [:edit, :update, :delete]
  end

  scope "/admin", Mango.Web.Admin, as: :admin do
    pipe_through [:browser, :admin]

    resources "/users", UserController
    get "/login", SessionController, :new
    post "/sendlink", SessionController, :send_link
    get "/magiclink", SessionController, :create
  end

end
