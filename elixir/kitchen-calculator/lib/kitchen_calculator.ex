defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  def to_milliliter({unit, volume}) do
    v = cond do
      :cup == unit -> 240 * volume
      :fluid_ounce == unit -> 30 * volume
      :teaspoon == unit -> 5 * volume
      :tablespoon == unit -> 15 * volume
      :milliliter == unit -> volume
    end

    {:milliliter, v}
  end

  def from_milliliter({:milliliter, volume}, unit) do
    v = cond do
      :cup == unit ->  volume / 240
      :fluid_ounce == unit ->  volume / 30
      :teaspoon == unit ->  volume / 5
      :tablespoon == unit ->  volume / 15
      :milliliter == unit -> volume
    end

    {unit, v}  
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
