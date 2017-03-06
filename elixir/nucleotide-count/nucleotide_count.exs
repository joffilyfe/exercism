defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    Enum.count(strand, fn(n) -> n == nucleotide end)
  end

  @spec histogram([char]) :: map
  def histogram(strand) do
    # This is a solution
    # Enum.reduce(strand, %{?A => 0, ?T => 0, ?C => 0, ?G => 0},
      # fn(n, dna) -> %{dna | n => dna[n] + 1} end)

    # This is more idiomatic solution 
    @nucleotides |> Map.new(&({&1, count(strand, &1)}))
  end
end
