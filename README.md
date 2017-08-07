# EctoInterval

Interval type for Ecto, currently only implemented for PostgreSQL, PR's to support others are welcome.

## Installation

If [available in Hex](https://hex.pm/packages/ecto_interval), the package can be installed
by adding `ecto_interval` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:ecto_interval, "~> 0.1.0"}]
end
```

## Usage

Add `require EctoInterval` to your schema files that require it, then just use `EctoInterval` as a field type, like:

```elixir
    field :renewal_period, EctoInterval, default: %{months: 0, days: 0, secs: 0}
```

