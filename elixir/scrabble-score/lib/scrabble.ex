defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> to_charlist()
    |> Enum.reduce(0, fn letter, acc ->
      case letter do
        l when l in ~c"AEIOULNRST" ->
          acc + 1

        l when l in ~c"DG" ->
          acc + 2

        l when l in ~c"BCMP" ->
          acc + 3

        l when l in ~c"FHVWY" ->
          acc + 4

        l when l in ~c"K" ->
          acc + 5

        l when l in ~c"JX" ->
          acc + 8

        l when l in ~c"QZ" ->
          acc + 10

        _ ->
          0
      end
    end)
  end
end
