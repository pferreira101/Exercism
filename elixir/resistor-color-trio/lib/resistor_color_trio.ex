defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @color_maps %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @k 1000
  @m 1_000_000
  @g 1_000_000_000

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([x, y, z | _t]) do
    number =
      String.to_integer(
        "#{@color_maps[x]}#{@color_maps[y]}#{String.duplicate("0", @color_maps[z])}"
      )

    cond do
      number > @g -> {number / @g, :gigaohms}
      number > @m -> {number / @m, :megaohms}
      number > @k -> {number / @k, :kiloohms}
      true -> {number, :ohms}
    end
  end
end
