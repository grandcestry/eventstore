import Config

config :logger, backends: []

config :ex_unit,
  capture_log: [level: :warn],
  assert_receive_timeout: 2_000,
  refute_receive_timeout: 100

default_config = [
  idle_interval: 100,
  username: "postgres",
  password: "postgres",
  database: "eventstore_test",
  hostname: "localhost",
  pool_size: 1,
  serializer: EventStore.JsonSerializer,
  subscription_retry_interval: 1_000
]

config :eventstore, TestEventStore, default_config
config :eventstore, SecondEventStore, Keyword.put(default_config, :database, "eventstore_test_2")
config :eventstore, SchemaEventStore, default_config

config :eventstore, event_stores: [TestEventStore, SecondEventStore, SchemaEventStore]
