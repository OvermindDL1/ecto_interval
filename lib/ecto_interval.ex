if Code.ensure_loaded?(Postgrex) do

  defmodule EctoInterval do
    @moduledoc """
    This implements Interval support for Postgrex that used to be in Ecto but no longer is.
    """

    def type, do: Postgrex.Interval

    def cast(%{"months" => months, "days" => days, "secs" => secs}) when is_binary(months) do
      try do
        months = String.to_integer(months)
        days = String.to_integer(days)
        secs = String.to_integer(secs)
        {:ok, %{months: months, days: days, secs: secs}}
      rescue
        ArgumentError -> :error
      end
    end
    # def cast({months, days, seconds}) do
    #   %{months: months, days: days, seconds: seconds}
    # end

    def load(%{months: months, days: days, secs: secs}) do
      {:ok, %Postgrex.Interval{months: months, days: days, secs: secs}}
    end

    def dump(%{:months => months, :days => days, :secs => secs}) do
      {:ok, %Postgrex.Interval{months: months, days: days, secs: secs}}
    end
    def dump(%{"months" => months, "days" => days, "secs" => secs}) do
      {:ok, %Postgrex.Interval{months: months, days: days, secs: secs}}
    end

  end

  defimpl String.Chars, for: [Postgrex.Interval] do
    import Kernel, except: [to_string: 1]
    def to_string(%{:months => months, :days => days, :secs => secs}) do
      m = if months === 0 do "" else " #{months} months" end
      d = if days === 0   do "" else " #{days} days" end
      s = if secs === 0   do "" else " #{secs} seconds" end
      if months === 0 and days === 0 and secs === 0 do
        "<None>"
      else
        "Every#{m}#{d}#{s}"
      end
    end
  end

  defimpl Inspect, for: [Postgrex.Interval] do
    def inspect(inv, _opts) do
      inspect(Map.from_struct(inv))
    end
  end

  defimpl Phoenix.HTML.Safe, for: [Postgrex.Interval] do
    def to_iodata(inv) do
      to_string(inv)
    end
  end

end
