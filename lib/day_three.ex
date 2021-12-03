defmodule AdventOfCode.DayThree do
  @input_path "resources/day_three.txt"
  @line_separator "\n"

  def run(), do: run(@input_path)

  def run(input_path) do
    input_path
    |> parse_file()
    |> power_consumption()
  end

  def power_consumption(_data), do: nil

  defp parse_file(path) do
    path
    |> File.read!()
    |> String.split(@line_separator, trim: true)
  end
end
