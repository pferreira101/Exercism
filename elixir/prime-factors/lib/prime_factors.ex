defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number) do
    get_factors(2, number, []) |> Enum.reverse()
  end

  defp get_factors(_f, 1, acc), do: acc

  defp get_factors(f, number, acc) do
    case rem(number, f) do
      0 -> get_factors(f, div(number, f), [f | acc])
      _ -> get_factors(f + 1, number, acc)
    end
  end
end
