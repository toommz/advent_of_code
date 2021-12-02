defmodule AdventOfCode.DayTwo do
  @input_path "resources/day_two.txt"
  @line_separator "\n"

  @moves [{~r/forward/, :forward}, {~r/up/, :up}, {~r/down/, :down}]

  def run(), do: run(@input_path)

  def run(input_path) do
    input_path
    |> parse_file()
    |> move()
  end

  def move(steps) do
    steps
    |> Enum.map(&parse/1)
    |> Enum.reduce([position: 0, depth: 0], &follow_step/2)
    |> final_value()

    # |> Enum.reduce([depth: 0, position: 0], &follow_step/2)
  end

  defp parse(step) do
    {_, move} =
      Enum.find(@moves, fn {regex, _move} ->
        String.match?(step, regex)
      end)

    {
      move,
      step |> String.split() |> List.last() |> String.to_integer()
    }
  end

  defp follow_step({:forward, value}, acc),
    do: [position: acc[:position] + value, depth: acc[:depth]]

  defp follow_step({:down, value}, acc),
    do: [position: acc[:position], depth: acc[:depth] + value]

  defp follow_step({:up, value}, acc), do: [position: acc[:position], depth: acc[:depth] - value]

  defp final_value(position: position, depth: depth), do: position * depth

  defp parse_file(path) do
    path
    |> File.read!()
    |> String.split(@line_separator, trim: true)
  end
end
