defmodule GuessingGame do
  def compare(secret, guess \\ :no_guess)

  def compare(_, :no_guess) do
    "Make a guess"
  end

  def compare(secret, guess) when secret == guess do
    "Correct"
  end

  def compare(secret, guess) when abs(secret-guess) == 1 do
    "So close"
  end

  def compare(secret, guess) when secret > guess do
    "Too low"
  end

  def compare(secret, guess) when secret < guess do
    "Too high"
  end


end
