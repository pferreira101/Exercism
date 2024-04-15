defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    [_ | t] = list
    t
  end

  def first(list) do
    [h | _] = list
    h
  end

  def count(list) do
    cond do
      [] == list -> 0
      [_ | t] = list -> 1 + count(t)
    end
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
