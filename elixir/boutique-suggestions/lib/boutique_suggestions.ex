defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max = Keyword.get(options, :maximum_price, 100)

    for top <- tops,
        bot <- bottoms,
        top.base_color != bot.base_color,
        top.price + bot.price < max do
      {top, bot}
    end
  end
end
