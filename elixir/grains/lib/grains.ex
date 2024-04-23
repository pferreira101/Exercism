defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer()) :: {:ok, pos_integer()} | {:error, String.t()}
  def square(n) when n < 1 or n > 64,
    do: {:error, "The requested square must be between 1 and 64 (inclusive)"}

  def square(n), do: {:ok, 2 ** (n - 1)}

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: {:ok, pos_integer()}
  def total do
    total =
      for n <- 1..64 do
        square(n)
      end
      |> Enum.reduce(0, &(Kernel.elem(&1, 1) + &2))

    {:ok, total}
  end
end
