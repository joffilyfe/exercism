defmodule RotationalCipher do
  @downcase 'abcdefghijklmnopqrstuvwxyz'
  @upcase 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> padd(shift)
    |> to_string
  end

  defp padd(text, shift) do

    shift = cond do
      shift >= 26 -> shift - 26
      true -> shift
    end

    text
    |> to_charlist
    |> Enum.map(fn(c) ->
        cond do
          c == ?\s -> c
          c in @downcase -> Enum.at(@downcase, (c + shift - 123))
          c in @upcase -> Enum.at(@upcase, (c + shift - ?Z - 1))
          true -> c
        end
      end)
  end
end