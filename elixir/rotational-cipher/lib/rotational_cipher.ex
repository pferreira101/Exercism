defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    String.codepoints(text)
    |> Enum.map(&do_shift(&1, shift))
    |> Enum.join()
  end

  defp do_shift(<<c>>, shift) do
    cond do
      c == ?\s ->
        <<" ">>

      c in ?a..?z ->
        if (c + shift) in ?a..?z, do: <<c + shift>>, else: <<?a + c + shift - ?z - 1>>

      c in ?A..?Z ->
        if (c + shift) in ?A..?Z, do: <<c + shift>>, else: <<?A + c + shift - ?Z - 1>>

      true ->
        <<c>>
    end
  end
end
