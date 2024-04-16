defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    fields = String.split(path, ".")
    extract(data, fields)
  end

  defp extract(data, []), do: data

  defp extract(data, [h | t]) do
    extract(data[h], t)
  end

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end
