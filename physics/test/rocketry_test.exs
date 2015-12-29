defmodule RocketryTest do
  use ExUnit.Case
  doctest Physics.Rocketry

  test "Physics.Rocketry earth" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "Physics.Rocketry moon" do
    assert_in_delta Physics.Rocketry.escape_velocity(:moon), 2.38, 0.1
  end

  test "Physics.Rocketry mars" do
    assert_in_delta Physics.Rocketry.escape_velocity(:mars), 5.03, 0.1
  end

  test "Physics.Rocketry.escape_velocity with map" do
    assert Physics.Rocketry.escape_velocity(%{mass: 100, radius: 50}) == 0.1
  end

  test "Physics.Rocketry.orbital_speed" do
    assert Physics.Rocketry.orbital_speed(100) == 7844.484019472349
  end

  test "Physics.Rocketry.orbital_speed earth" do
    assert Physics.Rocketry.orbital_speed(:earth, 100) == 7844.484019472349
  end

  test "Physics.Rocketry.orbital_speed mars" do
    assert Physics.Rocketry.orbital_speed(:mars, 100) == 3489.6295341646633
  end

  test "Physics.Rocketry.orbital_speed moon" do
    assert Physics.Rocketry.orbital_speed(:moon, 100) == 1633.179172993282
  end

  test "Physics.Rocketry.orbital_speed specify earth" do
    assert Physics.Rocketry.orbital_speed(Planets.earth, 100) == 7844.484019472349
  end

  test "Physics.Rocketry.orbital_acceleration" do
    assert_in_delta Physics.Rocketry.orbital_acceleration(100), 9.50, 0.01
  end

  test "Physics.Rocketry.orbital_acceleration earth" do
    assert_in_delta Physics.Rocketry.orbital_acceleration(:earth, 100), 9.50, 0.01
  end

  test "Physics.Rocketry.orbital_acceleration mars" do
    assert_in_delta Physics.Rocketry.orbital_acceleration(:mars, 100), 17.58, 0.01
  end

  test "Physics.Rocketry.orbital_acceleration moon" do
    assert_in_delta Physics.Rocketry.orbital_acceleration(:moon, 100), 33.47, 0.01
  end

  test "Physics.Rocketry.orbital_acceleration passing earth" do
    assert_in_delta Physics.Rocketry.orbital_acceleration(Planets.earth, 100), 9.50, 0.01
  end

  test "Physics.Rocketry.orbital_term" do
    assert Physics.Rocketry.orbital_term(100) == 1.5
  end

  test "Physics.Rocketry.orbital_term earth" do
    assert Physics.Rocketry.orbital_term(:earth, 100) == 1.5
  end

  test "Physics.Rocketry.orbital_term moon" do
    assert Physics.Rocketry.orbital_term(:moon, 100) == 2.0
  end

  test "Physics.Rocketry.orbital_term mars" do
    assert Physics.Rocketry.orbital_term(:mars, 100) == 1.8
  end

  test "Physics.Rocketry.orbital_term passing earth" do
    assert Physics.Rocketry.orbital_term(Planets.earth, 100) == 1.5
  end

  test "Physics.Rocketry.orbital_height" do
    assert_in_delta Physics.Rocketry.orbital_height(4), 6417.56, 0.01
  end

  test "Physics.Rocketry.orbital_height earth" do
    assert_in_delta Physics.Rocketry.orbital_height(:earth, 4), 6417.56, 0.01
  end

  test "Physics.Rocketry.orbital_height moon" do
    assert_in_delta Physics.Rocketry.orbital_height(:moon, 4), 1214.97, 0.01
  end

  test "Physics.Rocketry.orbital_height mars" do
    assert_in_delta Physics.Rocketry.orbital_height(:mars, 4), 2671.98, 0.01
  end

  test "Physics.Rocketry.orbital_height passing earth" do
    assert_in_delta Physics.Rocketry.orbital_height(Planets.earth, 4), 6417.56, 0.01
  end
end
