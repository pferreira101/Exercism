defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)

    cond do
      input == "" ->
        "Fine. Be that way!"

      String.upcase(input) == input and String.downcase(input) != input ->
        case String.ends_with?(input, "?") do
          true -> "Calm down, I know what I'm doing!"
          _ -> "Whoa, chill out!"
        end

      String.ends_with?(input, "?") ->
        "Sure."

      true ->
        "Whatever."
    end
  end
end
