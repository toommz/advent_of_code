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

  def power_consumption(data) do
    data
    |> Enum.map(&String.split(&1, ~r/.{1}/, trim: true, include_captures: true))
    |> Enum.zip()
    |> Enum.map(&count_duplicates/1)
    |> Enum.map(&find_epsilons_and_gammas/1)
    |> Enum.zip()
    |> Enum.map(&build_bitstring/1)
    |> calculate_final_value()
  end

  defp count_duplicates(duplicates) do
    duplicates
    |> Tuple.to_list()
    |> Enum.reduce({0, 0}, fn el, acc ->
      case el do
        "0" -> {elem(acc, 0) + 1, elem(acc, 1)}
        "1" -> {elem(acc, 0), elem(acc, 1) + 1}
      end
    end)
  end

  defp find_epsilons_and_gammas({zeros, ones}) do
    case zeros > ones do
      true -> ["0", "1"]
      false -> ["1", "0"]
    end
  end

  defp build_bitstring(tuple) do
    tuple
    |> Tuple.to_list()
    |> Enum.map(&String.to_integer/1)
    |> Integer.undigits(2)
  end

  defp calculate_final_value([epsilon, gamma]), do: epsilon * gamma
end
