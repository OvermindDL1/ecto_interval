# EctoInterval

Interval type for Ecto, currently only implemented for PostgreSQL, PR's to support others are welcome.

## Installation

If [available in Hex](https://hex.pm/packages/ecto_interval), the package can be installed
by adding `ecto_interval` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ecto_interval, "~> 0.2.2"}]
end
```

## Usage

Just use `EctoInterval` as a field type, like:

```elixir
    field :renewal_period, EctoInterval, default: %{months: 0, days: 0, secs: 0}
```

## Contributors

- Special thanks to @ibarchenkov for updating to latest implementation!

