defmodule ProteinTranslation do

  def stop_position([h|t]) do
    cond do
       h == "STOP" -> stop_position(t)
       Enum.any?(t, fn(s) -> s == "STOP" end) -> stop_position(t)
       :else -> [h] ++ t
    end
  end



  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do    
    result = Regex.scan(~r/\w{3}/, rna)
      |> Enum.map(fn(codon) -> of_codon(codon) end)
      |> Enum.map(fn({_, protein}) -> protein end)
      |> Enum.uniq
      |> Enum.reverse
      |> stop_position
      |> Enum.reverse

    cond do
      Enum.any?(result, fn(s) -> s == "invalid codon" end) -> {:error, "invalid RNA"}
      :else -> {:ok, result}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  def of_codon([codon]) do
    of_codon(codon)
  end
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do

    case codon do
      "AUG" -> {:ok, "Methionine"}      
      "UGU" -> {:ok, "Cysteine"}
      "UGC" -> {:ok, "Cysteine"}
      "UUU" -> {:ok, "Phenylalanine"}
      "UUC" -> {:ok, "Phenylalanine"}
      "UUA" -> {:ok, "Leucine"}
      "UUG" -> {:ok, "Leucine"}
      "UCU" -> {:ok, "Serine"}
      "UCC" -> {:ok, "Serine"}
      "UCA" -> {:ok, "Serine"}
      "UCG" -> {:ok, "Serine"}
      "UGG" -> {:ok, "Tryptophan"}
      "UAU" -> {:ok, "Tyrosine"}
      "UAC" -> {:ok, "Tyrosine"}
      "UAA" -> {:ok, "STOP"}
      "UAG" -> {:ok, "STOP"}
      "UGA" -> {:ok, "STOP"}
      _ -> {:error, "invalid codon"}
    end
  end
end