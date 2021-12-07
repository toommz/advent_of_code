defmodule AdventOfCode.DayThreeTest do
  use ExUnit.Case

  alias AdventOfCode.DayThree

  setup do
    data = [
      "00100",
      "11110",
      "10110",
      "10111",
      "10101",
      "01111",
      "00111",
      "11100",
      "10000",
      "11001",
      "00010",
      "01010"
    ]

    {:ok, %{data: data}}
  end

  describe "power_consumption/1" do
    test "returns the multiplication of current depth and horizontal position", %{
      data: data
    } do
      assert DayThree.power_consumption(data) == 198
    end
  end
end
