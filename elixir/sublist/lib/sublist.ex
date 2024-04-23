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

  defp sublist?(l1, l2) when length(l1) > length(l2), do: false

  defp sublist?(l1, l2) do
    Enum.take(l2, length(l1)) === l1 or sublist?(l1, tl(l2))
  end
end
