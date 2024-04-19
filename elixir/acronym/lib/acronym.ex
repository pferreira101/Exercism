defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[\s-_]/)
    |> Enum.filter(fn w -> w != "" && w != "-" end)
    |> Enum.map(fn word ->
      String.first(word) |> String.upcase()
    end)
    |> Enum.join()
  end
end
