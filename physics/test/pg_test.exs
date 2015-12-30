# createdb redfour
#
# create table solar_flares(
#   id serial primary key,
#   classification char(1) not null,
#   scale decimal(4,2) not null,
#   date timestamptz not null
# );
#
# psql redfour -c "alter table solar_flares add index int;"

defmodule PGTest do
  use ExUnit.Case
  use Timex

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

  # test "Connecting with postgrex", %{data: flares} do
  #   {:ok, pid} = Postgrex.Connection.start_link(hostname: "localhost", database: "redfour")

  #   sql = """
  #   insert into solar_flares(classification, scale, date)
  #   values ($1, $2, $3);
  #   """

  #   res = Enum.map flares, fn(flare) ->
  #     ts = %Postgrex.Timestamp{year: flare.date.year, month: flare.date.month, day: flare.date.day}
  #     Postgrex.Connection.query!(pid, sql, [Atom.to_string(flare.classification), flare.scale, ts])
  #   end

  #   IO.inspect res
  #   Postgrex.Connection.stop(pid)
  # end

  test "Querying with postgrex", %{data: flares} do
    {:ok, pid} = Postgrex.Connection.start_link(hostname: "localhost", database: "redfour")
    sql = """
    select * from solar_flares
    """
    res = Postgrex.Connection.query!(pid, sql, []) |> atomize_column |> transform_result

    # IO.inspect res
    Postgrex.Connection.stop(pid)
  end

  def transform_result_orig(result) do
    atomized = for col <- result.columns, do: String.to_atom(col)

    for row <- result.rows,
      row <- [List.replace_at(row, 1, (Enum.at(row, 1) |> String.to_atom))],
      do: List.zip([atomized, row]) |> Enum.into(%{})
  end

  def atomize_column(result) do
    Map.put(result, :columns, (for col <- result.columns, do: String.to_atom(col)))
  end

  def transform_result(result) do
    for row <- result.rows,
      row <- [List.replace_at(row, 1, (Enum.at(row, 1) |> String.to_atom))],
      do: List.zip([result.columns, row]) |> Enum.into(%{})
  end
end