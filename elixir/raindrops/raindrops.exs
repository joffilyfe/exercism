defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do

    result = check(number, [])

    cond do
      Enum.empty?(result) -> to_string(number)
      :else -> Enum.uniq(result) |> Enum.join
    end
  end

  @spec check(Integer, List) :: List
  defp check(number, result) do
    cond do
      number < 3 -> result
      rem(number, 3) == 0 -> check(div(number, 3), result ++ ["Pling"])
      rem(number, 5) == 0 -> check(div(number, 5), result ++ ["Plang"])
      rem(number, 7) == 0 -> check(div(number, 7), result ++ ["Plong"])
      true -> result
    end
  end
end