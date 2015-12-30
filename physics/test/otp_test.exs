defmodule OTPTest do
  use ExUnit.Case

  test "A simple spawn" do
    res = for n <- 1..3, do: spawn(fn() -> IO.inspect "HI" end)

    # IO.inspect res
  end
end