defmodule Username do

  def sanitize(username) do
    # ä becomes ae
    # ö <becomes oe
    # ü becomes ue
    # ß becomes ss

    case username do
      [] -> []
      [h | t] when h >= ?a and h <= ?z -> [h | sanitize(t)]
      [?_ | t] -> [?_ | sanitize(t)]
      [?ä | t] -> ~c"ae" ++ sanitize(t)
      [?ö | t] -> ~c"oe" ++ sanitize(t)
      [?ü | t] -> ~c"ue" ++ sanitize(t)
      [?ß | t] -> ~c"ss" ++ sanitize(t)
      [_ | t] -> sanitize(t)
    end
  end
end