import Config

config :ex_learn_influxdb, InfluxDbConnection,
  auth: [method: :token, token: "local-dev-token"],
  bucket: "events_dev",
  org: "learn-influx",
  version: :v2
