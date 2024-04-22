defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(~r/[,._:!&@$%^&?\t\n]/, " ")
    |> String.split()
    |> Enum.reduce(%{}, fn word, acc ->
      Map.update(acc, trim(word), 1, &(&1 + 1))
    end)
  end

  defp trim(word), do: String.trim(word, "'")
end
