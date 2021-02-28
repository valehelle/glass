# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :glass,
  ecto_repos: [Glass.Repo]

# Configures the endpoint
config :glass, GlassWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "STt+kRL5xzhYR7Jl4aHrEXBPDi/y+mmWE6MEOW8J3ZnZrctjakDWOJSlL3Qi/joF",
  render_errors: [view: GlassWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Glass.PubSub,
  live_view: [signing_salt: "GROfhnY7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

