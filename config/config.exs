# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :colder,
  ecto_repos: [Colder.Repo]

# Configures the endpoint
config :colder, ColderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "e5wpt6ObH5Map6tNKa4ORLTRMAnKD6F7hwi3o/dk9xcSQi0P4nruq8Z+YEooqOIF",
  render_errors: [view: ColderWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Colder.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "rSVePuTb"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
