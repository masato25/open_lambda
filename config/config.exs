# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fastweb_lambda,
  ecto_repos: [OpenLambda.Repo]

# Configures the endpoint
config :fastweb_lambda, OpenLambda.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dlj4+d7gE3rOqzM6T7B1/Golea8VZcCX/JZ6HZ1jTgiXU2GNfZF59BtPudFiqtEH",
  render_errors: [view: OpenLambda.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OpenLambda.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
