defmodule BottleSong do
  @moduledoc """
  Handles lyrics of the popular children song: Ten Green Bottles
  """

  @spec recite(pos_integer, pos_integer) :: String.t()
  def recite(start_bottle, take_down) do
    for n <- start_bottle..(start_bottle - take_down + 1) do
      """
      #{first_phrase(n)}
      #{first_phrase(n)}
      And if one green bottle should accidentally fall,
      There'll be #{stringify(n - 1) |> String.downcase()} green #{bottles(n - 1)} hanging on the wall.\
      """
    end
    |> Enum.join("\n\n")
  end

  defp first_phrase(n), do: "#{stringify(n)} green #{bottles(n)} hanging on the wall,"

  defp stringify(10), do: "Ten"
  defp stringify(9), do: "Nine"
  defp stringify(8), do: "Eight"
  defp stringify(7), do: "Seven"
  defp stringify(6), do: "Six"
  defp stringify(5), do: "Five"
  defp stringify(4), do: "Four"
  defp stringify(3), do: "Three"
  defp stringify(2), do: "Two"
  defp stringify(1), do: "One"
  defp stringify(0), do: "No"

  defp bottles(1), do: "bottle"
  defp bottles(_), do: "bottles"
end
