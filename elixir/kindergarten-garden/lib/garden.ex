defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @plants %{
    "V" => :violets,
    "C" => :clover,
    "R" => :radishes,
    "G" => :grass
  }

  @default_names [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry
  ]

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_names) do
    [first_line, second_line] = String.split(info_string, "\n")

    chunked_first_line =
      String.graphemes(first_line)
      |> Enum.chunk_every(2)

    chunked_second_line =
      String.graphemes(second_line)
      |> Enum.chunk_every(2)

    plants_by_student =
      Enum.zip_with(chunked_first_line, chunked_second_line, &Kernel.++/2)
      |> Enum.map(&translate/1)

    student_names
    |> Enum.sort()
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {name, i}, acc ->
      Map.put(acc, name, Enum.at(plants_by_student, i, {}))
    end)
  end

  defp translate(chars) do
    Enum.reduce(chars, {}, fn el, acc -> Tuple.append(acc, @plants[el]) end)
  end
end
