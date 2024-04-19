defmodule ProteinTranslation do
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna), do: of_rna(rna, [])

  defp of_rna("", acc), do: {:ok, Enum.reverse(acc)}

  defp of_rna(<<codon::binary-size(3), rest::binary>>, acc) do
    case of_codon(codon) do
      {:ok, "STOP"} -> of_rna("", acc)
      {:ok, protein} -> of_rna(rest, [protein | acc])
      {:error, _} -> {:error, "invalid RNA"}
    end
  end

  defp of_rna(_, _), do: {:error, "invalid RNA"}

  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    case codon do
      "AUG" -> {:ok, "Methionine"}
      "UGG" -> {:ok, "Tryptophan"}
      c when c in ["UGU", "UGC"] -> {:ok, "Cysteine"}
      c when c in ["UUA", "UUG"] -> {:ok, "Leucine"}
      c when c in ["UUU", "UUC"] -> {:ok, "Phenylalanine"}
      c when c in ["UCU", "UCC", "UCA", "UCG"] -> {:ok, "Serine"}
      c when c in ["UAU", "UAC"] -> {:ok, "Tyrosine"}
      c when c in ["UAA", "UAG", "UGA"] -> {:ok, "STOP"}
      _ -> {:error, "invalid codon"}
    end
  end
end
