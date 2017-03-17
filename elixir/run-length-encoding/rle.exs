defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/(.)\1*/, string)
    |> Enum.map(fn([qtd, char]) ->
      cond do
        String.length(qtd) == 1 -> "#{char}"
        true -> "#{String.length(qtd)}#{char}"
      end
    end)
    |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)?([a-zA-Z\s])/, string)
    |> Enum.reduce("", &reduce/2)
  end

  @spec reduce(List, String.t) :: String.t
  defp reduce([_, qtd, char], result) do
    qtd = case qtd do
      "" -> 1
      _ -> String.to_integer(qtd)
    end
    result <> String.duplicate(char, qtd)
  end

end
