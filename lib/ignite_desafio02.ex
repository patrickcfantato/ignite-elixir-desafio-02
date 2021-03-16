defmodule IgniteDesafio02 do
  @moduledoc """
  Documentation for `IgniteDesafio02`.
  """

  @doc """
  Count how many even numbers exists in an array of strings

  ## Examples

      iex> IgniteDesafio02.call(["1","2","3","4","5","6","7","8","banana"])
      :world

  """
  def call(list) do
    list_filter(list)
  end

  defp check_is_even(:error), do: 0

  defp check_is_even({number, _string}) do
    rem(number, 2) != 1
  end

  defp convert(value) do
    extracted_number = String.replace(value, ~r/[^\d]/, "")
    parsed_number = Integer.parse(extracted_number)
    check_is_even(parsed_number)
  end

  defp get_length([], size), do: size

  defp get_length([_hd | tl], size) do
    size = size + 1
    get_length(tl, size)
  end

  defp list_filter(list) do
    {_evens, odds} =
      Enum.split_with(list, fn value ->
        convert(value)
      end)

    get_length(odds, 0)
  end
end
