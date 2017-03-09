defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence = String.downcase(sentence) 
               |> String.split(~r/[^A-Za-z-\d0-9öäü]+/i, trim: true)
    sentence |> Map.new(&({&1, word_count(sentence, &1)}))
    
  end

  def word_count(sentence, word) do
    Enum.count(sentence, fn(w) -> w == word end)
  end
end
