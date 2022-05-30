defmodule Pissa do
  require Logger

  def calculator() do
    x = add(125, 225)
    x = substract(x, 50)
    x = divide(x, 5)
    multiply(x, 3)
  end

  def add(a, b) do
    x = a + b
    Logger.info("#{x}")
    x
  end

  def substract(a, b) do
    x = a - b
    Logger.info("#{x}")
    x
  end

  def divide(a, b) do
    x = a / b
    Logger.info("#{x}")
    x
  end

  def multiply(a, b) do
    x = a * b
    Logger.info("#{x}")
    x
  end
end

defmodule MySet do
  defstruct items: []
end

defmodule StringList do
  def upcase([]) do
    []
  end

  def upcase([first | rest]) do
    [String.upcase(first) | upcase(rest)]
  end
end

require Logger

defmodule Chapter2 do
  def greeting(name) do
    Logger.info("hi")
    greet = "Hello, #{name}!"
    greet <> "how are you?"
  end

  def total_price(price, quantity) do
    Logger.info("hi")
    price * quantity
  end
end
