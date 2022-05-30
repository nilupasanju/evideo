defmodule FunctionPractice3 do
  require Logger

  def main() do
    fun(1, "")
  end

  # use Recursion

  def fun(10, acc) do
    acc = "#{acc} 10"
    Logger.info("FUN #{acc}")
    acc
  end

  def fun(n, acc) do
    acc = "#{acc} 0#{n}"
    Logger.info("FUN #{acc}")
    fun(n + 1, acc)
  end

  # def fun(n, acc) do
  #  case n do
  #    10 ->
  #      value = "#{acc} 10"
  #      Logger.info("FUN #{value}")

  #    n ->
  #      value = "#{acc} 0#{n}"
  #      Logger.info("FUN #{value}")
  #      fun(n+1, value)
  #  end
  # end
end
