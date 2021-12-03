defmodule AdventOfCode.DayTwo do
  alias AdventOfCode.FileUtils

  @input_path "resources/day_two.txt"

  @moves [{~r/forward/, :forward}, {~r/up/, :up}, {~r/down/, :down}]

  def run(), do: run(@input_path)

  def run(input_path) do
    input_path
    |> FileUtils.parse_file()
    |> case do
      {:ok, data} -> move_evolved(data)
      {:error, error} -> IO.inspect(error)
    end
  end

  def move(steps) do
    steps
    |> Enum.map(&parse/1)
    |> Enum.reduce([position: 0, depth: 0], &follow_step/2)
    |> final_value()
  end

  def move_evolved(steps) do
    steps
    |> Enum.map(&parse/1)
    |> Enum.reduce([position: 0, depth: 0, aim: 0], &follow_step/2)
    |> final_value()
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

  defp follow_step({:forward, value}, position: position, depth: depth),
    do: [position: position + value, depth: depth]

  defp follow_step({:down, value}, position: position, depth: depth),
    do: [position: position, depth: depth + value]

  defp follow_step({:up, value}, position: position, depth: depth),
    do: [position: position, depth: depth - value]

  defp follow_step({:forward, value}, position: position, depth: depth, aim: aim),
    do: [position: position + value, depth: depth + aim * value, aim: aim]

  defp follow_step({:down, value}, position: position, depth: depth, aim: aim),
    do: [position: position, depth: depth, aim: aim + value]

  defp follow_step({:up, value}, position: position, depth: depth, aim: aim),
    do: [position: position, depth: depth, aim: aim - value]

  defp final_value(position: position, depth: depth), do: position * depth
  defp final_value(position: position, depth: depth, aim: _aim), do: position * depth
end
