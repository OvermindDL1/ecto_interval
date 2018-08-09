defmodule EctoIntervalTest do
  use ExUnit.Case
  doctest EctoInterval

  test "load" do
    assert {:ok, %Postgrex.Interval{months: 0, days: 0, secs: 0}} =
             EctoInterval.load(%{months: 0, days: 0, secs: 0})

    assert {:ok, %Postgrex.Interval{months: 1, days: 2, secs: 3}} =
             EctoInterval.load(%{months: 1, days: 2, secs: 3})
  end

  test "to_string" do
    {:ok, none} = EctoInterval.load(%{months: 0, days: 0, secs: 0})
    {:ok, some} = EctoInterval.load(%{months: 1, days: 2, secs: 3})
    {:ok, usual} = EctoInterval.load(%{months: 24, days: 0, secs: 0})
    assert "<None>" = to_string(none)
    assert "Every 1 months 2 days 3 seconds" = to_string(some)
    assert "Every 24 months" = to_string(usual)
  end
end
