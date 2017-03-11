
defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    result = ""
    string
    |> String.split
    |> process_words(result)
    |> String.upcase
  end

  defp process_words([], acc), do: acc
  defp process_words([head | tail], acc) do
    acc = acc <> String.first(head)
    [_ | t] = to_charlist(head)
    process_words(tail, acc <> get_upcased(t, ""))
  end

  @spec get_upcased(List, String) :: String
  defp get_upcased([], acc), do: acc
  defp get_upcased([head | tail], acc) do
    if head >= ?A && head <= ?Z do
      get_upcased(tail, acc <> to_string([head]))
    else
      get_upcased(tail, acc)    
    end
  end
end
