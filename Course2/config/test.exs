import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :course_1, Course1Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "OE4+Ol3Oq9+lOW0qurUODBO+M8hV5KGgz38Uih8+c5Ndgd5jr4FO7zzrSRgN0tkk",
  server: false

# In test we don't send emails
config :course_1, Course1.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
