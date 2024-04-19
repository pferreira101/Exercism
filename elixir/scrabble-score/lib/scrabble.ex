defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.graphemes()
    |> Enum.map(&String.upcase/1)
    |> Enum.filter(&(&1 not in [" ", "\t", "\n"]))
    |> Enum.reduce(0, fn letter, acc ->
      case letter do
        l when l in ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] ->
          acc + 1

        l when l in ["D", "G"] ->
          acc + 2

        l when l in ["B", "C", "M", "P"] ->
          acc + 3

        l when l in ["F", "H", "V", "W", "Y"] ->
          acc + 4

        l when l in ["K"] ->
          acc + 5

        l when l in ["J", "X"] ->
          acc + 8

        l when l in ["Q", "Z"] ->
          acc + 10
      end
    end)
  end
end
