defmodule AdventOfCode.DayTwoTest do
  use ExUnit.Case

  setup do
    steps = [
      "forward 5",
      "down 5",
      "forward 8",
      "up 3",
      "down 8",
      "forward 2"
    ]

    {:ok, %{steps: steps}}
  end

  alias AdventOfCode.DayTwo

  describe "move/1" do
    test "returns the multiplication of current depth and horizontal position", %{
      steps: steps
    } do
      assert DayTwo.move(steps) == 150
    end
  end

  describe "move_evolved/1" do
    test "returns the multiplication of current depth and horizontal position keeping aim in mind",
         %{
           steps: steps
         } do
      assert DayTwo.move_evolved(steps) == 900
    end
  end
end
