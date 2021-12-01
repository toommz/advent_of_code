defmodule AdventOfCode.DayOne do
  @input_path "resources/day_one.txt"
  @line_separator "\n"

  def run(), do: run(@input_path)

  def run(input_path) do
    input_path
    |> parse_file()
    |> sonar_depth()
  end

  def sonar_depth(steps) do
    steps
    |> Enum.reduce({nil, 0}, &parse_depths/2)
    |> elem(1)
  end

  defp parse_depths(current, {nil, 0}), do: {current, 0}

  defp parse_depths(current, {previous, total}) do
    case current > previous do
      true -> {current, total + 1}
      false -> {current, total}
    end
  end

  defp parse_file(path) do
    path
    |> File.read!()
    |> String.split(@line_separator, trim: true)
    |> Enum.map(&Integer.parse/1)
  end
end