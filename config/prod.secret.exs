use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :kindy_now_qk, InfoCare.Endpoint,
  secret_key_base: "EfQUrWuZEHl8im8R37bi3IogSz8jxjAkkfgE8avicpK459gsQNqHNjHZmu+ifPFt"

# Configure your database
config :kindy_now_qk, InfoCare.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "kindy_now_qk_prod",
  pool_size: 20
