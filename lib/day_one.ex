defmodule AdventOfCode.DayOne do
  alias AdventOfCode.FileUtils

  @input_path "resources/day_one.txt"

  def run(), do: run(@input_path)

  def run(input_path) do
    input_path
    |> FileUtils.parse_file()
    |> case do
      {:ok, data} -> sonar_depth_evolved(data)
      {:error, error} -> IO.inspect(error)
    end
  end

  def sonar_depth(steps) do
    steps
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce({nil, 0}, &parse_depths/2)
    |> elem(1)
  end

  def sonar_depth_evolved(steps) do
    steps
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> Enum.reduce({nil, 0}, &parse_depths/2)
    |> elem(1)
  end

  defp parse_depths(current, {nil, 0}), do: {current, 0}
  defp parse_depths(current, {previous, total}) when current > previous, do: {current, total + 1}
  defp parse_depths(current, {_previous, total}), do: {current, total}
end
