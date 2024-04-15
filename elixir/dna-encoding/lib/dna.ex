defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      _ -> 0b0000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      _ -> ?\s
    end
  end

  def encode(code) do
    do_encode(code, <<>>)
  end

  defp do_encode([], acc), do: acc
  defp do_encode([n | rest], acc) do
    do_encode(rest, <<acc::bitstring, encode_nucleotide(n)::4>>)
  end

  def decode(dna) do
    do_decode(dna, [])
  end

  defp do_decode(<<>>, acc), do: acc
  defp do_decode(<<h::4, t::bitstring>>, acc) do
    do_decode(t, acc ++ [decode_nucleotide(h)])
  end
end

