defmodule Planet do
  import Physics.Laws
  import Calcs

  defstruct [
    type: nil,
    mass: 0,
    radius: 0,
    ev: 0
  ]

  def load do
    for planet <- list do
      planet
        |> calc_ev
    end
  end

  def select do
    list
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp calc_ev({name, data}) do
    {name, %{data | ev: calculate_escape(data)}}
  end

  defp list do
    [
      {:mercury, %Planet{type: :rocky, mass: 3.3e23, radius: 2.439e6}},
      {:venus, %Planet{type: :rocky, mass: 4.86e24, radius: 6.05e6}},
      {:earth, %Planet{type: :rocky, mass: 5.972e24, radius: 6.37e6}},
      {:mars, %Planet{type: :rocky, mass: 6.41e23, radius: 3.37e6}},
      {:jupiter, %Planet{type: :gaseous, mass: 1.89e27, radius: 7.14e7}},
      {:saturn, %Planet{type: :gaseous, mass: 5.68e26, radius: 6.02e7}},
      {:uranus, %Planet{type: :gaseous, mass: 8.68e25, radius: 2.55e7}},
      {:neptune, %Planet{type: :gaseous, mass: 1.02e26, radius: 2.47e7}},
    ]
  end

end
