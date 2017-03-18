defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      is_sublist?(a, b) -> :sublist
      is_sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  @spec is_sublist?(List, List) :: Boolean
  defp is_sublist?(a, b) when length(a) <= length(b) do
    cond do
      a === Enum.take(b, length(a)) -> true
      true -> is_sublist?(a, tl(b))
    end
  end
  defp is_sublist?(_, _), do: false
end
