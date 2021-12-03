defmodule AdventOfCode.FileUtils do
  @line_separator "\n"

  def parse_file(path) do
    path
    |> File.read()
    |> case do
      {:ok, content} -> {:ok, parse_lines(content)}
      {_, error} -> {:error, error}
    end
  end

  defp parse_lines(lines) do
    String.split(lines, @line_separator, trim: true)
  end
end
