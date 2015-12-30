defmodule PlanetsTest do
  use ExUnit.Case
  doctest Planet

  test 'Plant.load' do
    assert Planet.load == [
      {:mercury, %Planet{ev: 4249.390376652365, mass: 3.3e23, radius: 2.439e6, type: :rocky}},
      {:venus, %Planet{ev: 10354.187079758827, mass: 4.86e24, radius: 6.05e6, type: :rocky}},
      {:earth, %Planet{ev: 11185.766353576204, mass: 5.972e24, radius: 6.37e6, type: :rocky}},
      {:mars, %Planet{ev: 5038.364979010658, mass: 6.41e23, radius: 3.37e6, type: :rocky}},
      {:jupiter, %Planet{ev: 59437.0650846957, mass: 1.89e27, radius: 7.14e7, type: :gaseous}},
      {:saturn, %Planet{ev: 35485.545229935255, mass: 5.68e26, radius: 6.02e7, type: :gaseous}},
      {:uranus, %Planet{ev: 21314.018216868906, mass: 8.68e25, radius: 2.55e7, type: :gaseous}},
      {:neptune, %Planet{ev: 23476.165878875316, mass: 1.02e26, radius: 2.47e7, type: :gaseous}}]
  end

  test 'Planet.select for earth' do
     assert Planet.select[:earth] == %Planet{mass: 5.972e24, radius: 6.37e6, type: :rocky}
  end
end
