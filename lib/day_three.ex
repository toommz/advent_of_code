defmodule AdventOfCode.DayThree do
  alias AdventOfCode.FileUtils

  @input_path "resources/day_three.txt"

  def run(), do: run(@input_path)

  def run(input_path) do
    input_path
    |> FileUtils.parse_file()
    |> case do
      {:ok, data} -> power_consumption(data)
      {:error, error} -> IO.inspect(error)
    end
  end

  def power_consumption(_data), do: nil
end
