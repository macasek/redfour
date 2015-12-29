defmodule Physics.Rocketry do
  import Calcs
  import Physics.Laws, only: [newtons_gravitational_constant: 0]
  import Planets

  def escape_velocity(:earth) do
    earth
      |> escape_velocity
  end

  def escape_velocity(:moon) do
    moon
      |> escape_velocity
  end

  def escape_velocity(:mars) do
    mars
      |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  def orbital_speed(height), do: orbital_speed(earth, height)
  def orbital_speed(:earth, height), do: orbital_speed(earth, height)
  def orbital_speed(:moon, height), do: orbital_speed(moon, height)
  def orbital_speed(:mars, height), do: orbital_speed(mars, height)
  def orbital_speed(planet, height) do
    newtons_gravitational_constant * planet.mass / orbital_radius(planet, height)
      |> square_root
  end

  def orbital_acceleration(height), do: orbital_acceleration(earth, height)
  def orbital_acceleration(:earth, height), do: orbital_acceleration(earth, height)
  def orbital_acceleration(:mars, height), do: orbital_acceleration(mars, height)
  def orbital_acceleration(:moon, height), do: orbital_acceleration(moon, height)
  def orbital_acceleration(planet, height) do
    (orbital_speed(height) |> squared) / orbital_radius(planet, height)
  end

  def orbital_term(height), do: orbital_term(earth, height)
  def orbital_term(:earth, height), do: orbital_term(earth, height)
  def orbital_term(:moon, height), do: orbital_term(moon, height)
  def orbital_term(:mars, height), do: orbital_term(mars, height)
  def orbital_term(planet, height) do
    4 * (:math.pi |> squared) * (orbital_radius(planet, height) |> cubed) / (newtons_gravitational_constant * planet.mass)
      |> square_root
      |> seconds_to_hours
  end

  def orbital_height(hours), do: orbital_height(earth, hours)
  def orbital_height(:earth, hours), do: orbital_height(earth, hours)
  def orbital_height(:mars, hours), do: orbital_height(mars, hours)
  def orbital_height(:moon, hours), do: orbital_height(moon, hours)
  def orbital_height(planet, hours) do
    (newtons_gravitational_constant * planet.mass * (hours_to_seconds(hours) |> squared)) / (4 * (:math.pi |> squared))
      |> cubed_root
      |> from_surface(planet)
      |> to_km
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_radius(height), do: orbital_radius(Planet.earth, height)
  defp orbital_radius(planet, height) do
    planet.radius + (height |> to_m)
  end

  defp from_surface(height, planet) do
    height - planet.radius
  end
end