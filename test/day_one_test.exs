defmodule AdventOfCode.DayOneTest do
  use ExUnit.Case

  setup do
    steps = [
      "199",
      "200",
      "208",
      "210",
      "200",
      "207",
      "240",
      "269",
      "260",
      "263"
    ]

    {:ok, %{steps: steps}}
  end

  alias AdventOfCode.DayOne

  describe "sonar_depth/1" do
    test "returns the number of times the depth increased compared to the previous one", %{
      steps: steps
    } do
      assert DayOne.sonar_depth(steps) == 7
    end
  end

  describe "sonar_depth_evolved/1" do
    test "returns the number of times the depth increased compared to the previous one", %{
      steps: steps
    } do
      assert DayOne.sonar_depth_evolved(steps) == 5
    end
  end
end
