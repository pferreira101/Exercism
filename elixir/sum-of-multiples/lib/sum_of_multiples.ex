defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.map(&get_multiples(&1, limit))
    |> List.flatten()
    |> Enum.uniq()
    |> Enum.sum()
  end

  defp get_multiples(factor, limit) do
    for x <- 1..limit, x * factor < limit, do: x * factor
  end
end
