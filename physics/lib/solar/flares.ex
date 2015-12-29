defmodule Solar.Flare do
  defstruct [
    classification: :M,
    scale: 0,
    power: 0,
    is_deadly: false,
    date: nil
  ]

  def load(flares) do
    Enum.map flares, fn (flare) ->
      flare
        |> calculate_power
        |> calculate_deadliness
    end
  end

  def load_comprehension(flares) do
    for flare <- flares,
      do: flare |> calculate_power |> calculate_deadliness
  end

  def power(%{classification: :X, scale: scale} ), do: 1000 * scale
  def power(%{classification: :M, scale: scale}), do: 10 * scale
  def power(%{classification: :C, scale: scale}), do: 1 * scale

  def calculate_power(flare) do
    factor = case flare.classification do
      :M -> 10
      :X -> 1000
      :C -> 1
    end
    %{flare | power: flare.scale * factor}
  end

  def calculate_deadliness(flare) do
    %{flare | is_deadly: flare.power > 1000}
  end

  def no_eva(flares) do
    Enum.filter flares, fn (flare) ->
      power(flare) > 1000
    end
  end

  def deadliest(flares) do
    Enum.map(flares, &(power(&1)))
      |> Enum.max
  end

  def total_flare_power_sum(flares) do
    Enum.map(flares, &(power(&1)))
      |> Enum.sum
  end

  def total_flare_power_recursive(flares) do
    total_flare_power_recursive(flares, 0)
  end

  def total_flare_power_recursive([h|t], total) do
    total_flare_power_recursive(t, total + power(h))
  end

  def total_flare_power_recursive([], total) do
    total
  end

  def total_flare_power_reduce(flares) do
    Enum.reduce flares, 0, fn(flare, total) ->
      power(flare) + total
    end
  end

  def total_flare_power_comprehension(flares) do
    (for flare <- flares, do: power(flare))
      |> Enum.sum
  end

  def flare_list(flares) do
    Enum.map flares, fn (flare) ->
      p = power(flare)
      {:flare, :power, p, :is_deadly, p > 1000}
    end
  end

  def flare_map(flares) do
    Enum.map flares, fn (flare) ->
      p = power(flare)
      %{power: p, is_deadly: p > 1000}
    end
  end

  def flare_comprehension(flares) do
    for flare <- flares, do: %{power: power(flare), is_deadly: power(flare) > 1000}
  end

  def flare_comprehension(flares, classification) do
    for flare <- flares,
      flare.classification == classification,
      power <- [power(flare)],
      is_deadly <- [power > 1000],
    do: %{power: power, is_deadly: is_deadly}
  end
end