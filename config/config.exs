# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mvp_elixir,
  ecto_repos: [MvpElixir.Repo]

# Configures the endpoint
config :mvp_elixir, MvpElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/lt03eG4b3g6e54LvnnBYJUZajl08FHExxRCddA+OU3mDz+uFYD8Pg17+iKohFfJ",
  render_errors: [view: MvpElixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MvpElixir.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
