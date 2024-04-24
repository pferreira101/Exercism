defmodule Prime do
  @doc """
  Generates the nth prime.
  """

  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise(ArgumentError, message: "invalid argument zero")

  def nth(count) do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&prime?/1)
    |> Enum.take(count)
    |> List.last()
  end

  defp prime?(2), do: true

  defp prime?(n) do
    2..max(2, div(n, 2))
    |> Enum.all?(&(rem(n, &1) !== 0))
  end
end
