defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    isbn =
      String.replace(isbn, "-", "")

    match = Regex.match?(~r/^\d{9}(\d|X)$/, isbn)

    if match do
      isbn
      |> String.graphemes()
      |> Enum.map(fn s ->
        case s do
          "X" -> 10
          _ -> String.to_integer(s)
        end
      end)
      |> Enum.zip_with(10..1, &*/2)
      |> Enum.sum()
      |> rem(11)
      |> Kernel.==(0)
    end
  end
end
