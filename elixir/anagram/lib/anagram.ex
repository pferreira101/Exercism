defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    downcase_base = String.downcase(base)
    sorted_base = downcase_base |> String.to_charlist() |> Enum.sort()

    candidates
    |> Enum.map(fn candidate ->
      {candidate, String.downcase(candidate), to_downcase_sorted(candidate)}
    end)
    |> Enum.filter(&(elem(&1, 1) != downcase_base && elem(&1, 2) == sorted_base))
    |> Enum.map(&elem(&1, 0))
  end

  defp to_downcase_sorted(word), do: String.downcase(word) |> String.to_charlist() |> Enum.sort()
end
