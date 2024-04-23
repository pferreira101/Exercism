defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(l1, l2) do
    cond do
      l1 === l2 -> :equal
      sublist?(l1, l2) -> :sublist
      sublist?(l2, l1) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: true

  defp sublist?(l1, l2) do
    Enum.chunk_every(l2, length(l1), 1, :discard)
    |> Enum.any?(&(&1 === l1))
  end
end
