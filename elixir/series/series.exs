defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    cond do
      size <= 0 -> []
      String.length(s) >= size -> slice_at(to_charlist(s), size, [])
      true -> []
    end
  end

  defp slice_at([], size, list), do: list
  defp slice_at([h|t], size, list) do
    slice = to_string([h] ++ Enum.slice(t, 0, size-1))
    list = List.insert_at(list, -1, slice)

    cond do
      Enum.count(t) + 1 < size -> list
      Enum.count(t) >= size -> slice_at(t, size, list)
      true -> list
    end
  end
end
