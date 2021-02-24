defmodule GlassWeb.Router do
  use GlassWeb, :router

  import GlassWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GlassWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/register", PageController, :new
    get "/success", PageController, :success
    post "/register", PageController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", GlassWeb do
  #   pipe_through :api
  # end

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
     # live_dashboard "/dashboard", metrics: GlassWeb.Telemetry
    end
  end

  ## Authentication routes

  scope "/", GlassWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

     get "/magic_link/login", UserSessionController, :magic_link_login
     get "/users/register", UserRegistrationController, :new
     post "/users/register", UserRegistrationController, :create
     get "/users/log_in", UserSessionController, :new
     post "/users/log_in", UserSessionController, :create
#    get "/users/reset_password", UserResetPasswordController, :new
#    post "/users/reset_password", UserResetPasswordController, :create
#    get "/users/reset_password/:token", UserResetPasswordController, :edit
#    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", GlassWeb do
    pipe_through [:browser, :require_authenticated_user]
     get "/oauth/github/callback", OauthController, :callback 
     get "/oauth/edit", OauthController, :edit
     put "/oauth/edit", OauthController, :update
     get "/profile", DashboardController, :index
     get "/basic", BasicController, :edit
     put "/basic", BasicController, :update
     get "/admin", AdminController, :index 

     get "/resume/json", ResumeController, :json_resp 
     get "/resume", ResumeController, :index 

     get "/education/new", EducationController, :new
     post "/education/new", EducationController, :create
     get "/education/:education_id", EducationController, :show
     get "/education/:education_id/edit", EducationController, :edit
     put "/education/:education_id/edit", EducationController, :update
     delete "/education/:education_id/edit", EducationController, :delete

     get "/language/new", LanguageController, :new
     post "/language/new", LanguageController, :create
     get "/language/:language_id", LanguageController, :show
     get "/language/:language_id/edit", LanguageController, :edit
     put "/language/:language_id/edit", LanguageController, :update
     delete "/language/:language_id/edit", LanguageController, :delete

     get "/skill/new", SkillController, :new
     post "/skill/new", SkillController, :create
     get "/skill/:skill_id", SkillController, :show
     get "/skill/:skill_id/edit", SkillController, :edit
     put "/skill/:skill_id/edit", SkillController, :update
     delete "/skill/:skill_id/edit", SkillController, :delete


     get "/work/new", WorkController, :new
     post "/work/new", WorkController, :create
     get "/work/:work_id", WorkController, :show
     get "/work/:work_id/edit", WorkController, :edit
     put "/work/:work_id/edit", WorkController, :update
     delete "/work/:work_id/edit", WorkController, :delete  

#    get "/users/settings", UserSettingsController, :edit
#    put "/users/settings", UserSettingsController, :update
#    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  end

  scope "/", GlassWeb do
    pipe_through [:browser]
    get "/lg/:username", PageController, :user_profile 
    delete "/users/log_out", UserSessionController, :delete
    get "/check_email", PageController, :check_email
    get "/terms", PageController, :terms
    get "/privacy", PageController, :privacy
#    get "/users/confirm", UserConfirmationController, :new
#    post "/users/confirm", UserConfirmationController, :create
#    get "/users/confirm/:token", UserConfirmationController, :confirm
  end
end
