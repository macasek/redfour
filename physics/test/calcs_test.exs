defmodule CalcsTest do
  use ExUnit.Case
  doctest Calcs

  test "Calcs.to_nearest_tenth" do
    assert Calcs.to_nearest_tenth(11.23) == 11.3
  end

  test "Calcs.to_km" do
    assert Calcs.to_km(1000) == 1
  end

  test "Calcs.to_m" do
    assert Calcs.to_m(1) == 1000
  end

  test "Calcs.square_root" do
    assert Calcs.square_root(64) == 8
  end

  test "Calcs.squared" do
    assert Calcs.squared(8) == 64
  end

  test "Calcs.cubed" do
    assert Calcs.cubed(8) == 512
  end

  test "Calcs.seconds_to_hours" do
    assert Calcs.seconds_to_hours(3600) == 1
  end

  test "Calcs.cubed_root" do
    assert Calcs.cubed_root(8) == 2
  end

  test "Calcs.hours_to_seconds" do
    assert Calcs.hours_to_seconds(1) == 3600
  end
end
