import Config

# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# third-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :elixir_tutorial, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:elixir_tutorial, :key)

# Example configuration
config :elixir_tutorial,
  greeting: "Welcome to Elixir Tutorial!",
  max_counter_value: 1000

# Configuration for different environments can be set in:
# config/dev.exs
# config/test.exs
# config/prod.exs

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
