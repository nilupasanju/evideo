defmodule FENUM do
  require Logger

  def main(list) do
    for x <- list do
      do_double(x)
    end

    Enum.map(list, &do_double/1)

    Enum.map(list, fn {key, x} ->
      x = (x + 4) * 5
      {key, x}
    end)
  end

  defp do_double({key, x}) do
    x = (x + 4) * 5
    {key, x}
  end

  def keshi(list) do
    Enum.all?(list)
  end
end
