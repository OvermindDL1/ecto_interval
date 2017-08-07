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

Just use `EctoInterval` as a field type, like:

```elixir
    field :renewal_period, EctoInterval, default: %{months: 0, days: 0, secs: 0}
```

## Errata

At the time of this writing Mix has a bug that does not put optional dependencies before a dependency in the compile-graph, if this happens you'll see that EctoInterval does not compile, and if that happens then after compiling the deps, clean `ecto_interval` and re-download and compile it without cleaning postgrex, then it will work.  Hopefully this will be fixed soon at:  https://github.com/elixir-lang/elixir/issues/6438


