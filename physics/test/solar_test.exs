defmodule SolarTest do
  use ExUnit.Case
  use Timex
  doctest Solar.Flare

  setup do
    flares = [
      %Solar.Flare{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
      %Solar.Flare{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
      %Solar.Flare{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
      %Solar.Flare{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
      %Solar.Flare{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %Solar.Flare{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
      %Solar.Flare{classification: :X, scale: 72, date: Date.from({2012, 7, 23})},
      %Solar.Flare{classification: :X, scale: 45, date: Date.from({2003, 11, 4})},
    ]

    {:ok, data: flares}
  end

  test "A Solar Flare is a Map with a special key" do
    assert %Solar.Flare{}.__struct__ == Solar.Flare
  end

  test 'Solar.Flare.load', %{data: flares} do
    result = Solar.Flare.load(flares)

     assert result == [
       %Solar.Flare{classification: :X, scale: 99, date: Date.from({1859, 8, 29}), power: 99000, is_deadly: true},
       %Solar.Flare{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12}), power: 58.0, is_deadly: false},
       %Solar.Flare{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9}), power: 12.0, is_deadly: false},
       %Solar.Flare{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18}), power: 3.2, is_deadly: false},
       %Solar.Flare{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23}), power: 836.0, is_deadly: false},
       %Solar.Flare{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4}), power: 2.5, is_deadly: false},
       %Solar.Flare{classification: :X, scale: 72, date: Date.from({2012, 7, 23}), power: 72000, is_deadly: true},
       %Solar.Flare{classification: :X, scale: 45, date: Date.from({2003, 11, 4}), power: 45000, is_deadly: true}
    ]
  end

  test 'Solar.Flare.load_comprehension', %{data: flares} do
    result = Solar.Flare.load_comprehension(flares)

     assert result == [
       %Solar.Flare{classification: :X, scale: 99, date: Date.from({1859, 8, 29}), power: 99000, is_deadly: true},
       %Solar.Flare{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12}), power: 58.0, is_deadly: false},
       %Solar.Flare{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9}), power: 12.0, is_deadly: false},
       %Solar.Flare{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18}), power: 3.2, is_deadly: false},
       %Solar.Flare{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23}), power: 836.0, is_deadly: false},
       %Solar.Flare{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4}), power: 2.5, is_deadly: false},
       %Solar.Flare{classification: :X, scale: 72, date: Date.from({2012, 7, 23}), power: 72000, is_deadly: true},
       %Solar.Flare{classification: :X, scale: 45, date: Date.from({2003, 11, 4}), power: 45000, is_deadly: true}
    ]
  end

  test 'Solar.Flare.calculate_power', %{data: flares} do
    assert Solar.Flare.calculate_power(List.first(flares)) == %Solar.Flare{classification: :X, scale: 99, date: Date.from({1859, 8, 29}), power: 99000, is_deadly: false}
  end

  test 'Solar.Flare.calculate_deadliness', %{data: flares} do
    flare = Solar.Flare.calculate_power(List.first(flares))
    assert Solar.Flare.calculate_deadliness(flare) == %Solar.Flare{classification: :X, scale: 99, date: Date.from({1859, 8, 29}), power: 99000, is_deadly: true}
  end

  test "We have 8 solar flares", %{data: flares} do
    assert length(flares) == 8
  end

  test "Solar.Flare.power for X", %{data: flares} do
    assert Solar.Flare.power(List.first(flares)) == 99000
  end

  test "Solar.Flare.power for M", %{data: flares} do
    assert Solar.Flare.power(Enum.at(flares, 1)) == 58
  end

  test "Solar.Flare.power for C", %{data: flares} do
    assert Solar.Flare.power(Enum.at(flares, 3)) == 3.2
  end

  test "Solar.Flare.no_eva", %{data: flares} do
    assert length(Solar.Flare.no_eva(flares)) == 3
  end

  test "Solar.Flare.deadliest", %{data: flares} do
    assert Solar.Flare.deadliest(flares) == 99000
  end

  test "Solar.Flare.total_flare_power_sum", %{data: flares} do
    assert Solar.Flare.total_flare_power_sum(flares) == 216911.7
  end

  test "Solar.Flare.total_flare_power_recursive", %{data: flares} do
    assert Solar.Flare.total_flare_power_recursive(flares) == 216911.7
  end

  test "Solar.Flare.total_flare_power_reduce", %{data: flares} do
    assert Solar.Flare.total_flare_power_reduce(flares) == 216911.7
  end

  test "Solar.Flare.total_flare_power_comprehension", %{data: flares} do
    assert Solar.Flare.total_flare_power_comprehension(flares) == 216911.7
  end

  test "Solar.Flare.flare_list", %{data: flares} do
    result = Solar.Flare.flare_list(flares)

    assert result == [
      {:flare, :power, 99000, :is_deadly, true},
      {:flare, :power, 58.0, :is_deadly, false},
      {:flare, :power, 12.0, :is_deadly, false},
      {:flare, :power, 3.2, :is_deadly, false},
      {:flare, :power, 836.0, :is_deadly, false},
      {:flare, :power, 2.5, :is_deadly, false},
      {:flare, :power, 72000, :is_deadly, true},
      {:flare, :power, 45000, :is_deadly, true}
   ]
  end

  test "Solar.Flare.flare_map", %{data: flares} do
    result = Solar.Flare.flare_map(flares)

    assert result == [
      %{power: 99000, is_deadly: true},
      %{power: 58.0, is_deadly: false},
      %{power: 12.0, is_deadly: false},
      %{power: 3.2, is_deadly: false},
      %{power: 836.0, is_deadly: false},
      %{power: 2.5, is_deadly: false},
      %{power: 72000, is_deadly: true},
      %{power: 45000, is_deadly: true}
   ]
  end

  test "Solar.Flare.flare_comprehension", %{data: flares} do
    result = Solar.Flare.flare_comprehension(flares)

    assert result == [
      %{power: 99000, is_deadly: true},
      %{power: 58.0, is_deadly: false},
      %{power: 12.0, is_deadly: false},
      %{power: 3.2, is_deadly: false},
      %{power: 836.0, is_deadly: false},
      %{power: 2.5, is_deadly: false},
      %{power: 72000, is_deadly: true},
      %{power: 45000, is_deadly: true}
   ]
  end

  test "Solar.Flare.flare_comprehension with filters", %{data: flares} do
    result = Solar.Flare.flare_comprehension(flares, :X)

    assert result == [
      %{power: 99000, is_deadly: true},
      %{power: 72000, is_deadly: true},
      %{power: 45000, is_deadly: true}
   ]
  end
end
