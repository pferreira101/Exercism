defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part(ast, acc) do
    case ast do
      {op, _, args} when op in [:def, :defp] -> {ast, [get_function_name(args) | acc]}
      _ -> {ast, acc}
    end
  end

  defp get_function_name(args) do
    case args do
      [{:when, _, args} | _] -> get_function_name(args)
      [{func, _, args} | _] when is_list(args) -> to_string(func) |> String.slice(0, length(args))
      [{_, _, nil} | _] -> ""
    end
  end

  def decode_secret_message(string) do
    {_, acc} =
      string
      |> to_ast()
      |> Macro.prewalk([], &decode_secret_message_part/2)

    acc
    |> Enum.reverse()
    |> Enum.join()
  end
end
