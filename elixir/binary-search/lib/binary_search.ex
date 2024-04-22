defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _key), do: :not_found

  def search(numbers, key) do
    do_search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp do_search(numbers, key, min, max) do
    pos = min + div(max - min, 2)
    m = elem(numbers, pos)

    cond do
      m == key -> {:ok, pos}
      min >= max -> :not_found
      m < key -> do_search(numbers, key, pos + 1, max)
      m > key -> do_search(numbers, key, min, pos - 1)
    end
  end
end
