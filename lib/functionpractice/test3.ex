defmodule FunctionPractice do
  require Logger
  # function call and return previous value
  # assin varable
  def main() do
    x = fun_01("")
    x = fun_02(x)
    x = fun_03(x)
    x = fun_04(x)
    x = fun_05(x)
    x = fun_06(x)
    x = fun_07(x)
    x = fun_08(x)
    x = fun_09(x)
    fun_10(x)
  end

  def fun_01(x) do
    Logger.info("FUN" <> x)
    x <> " 01"
  end

  def fun_02(x) do
    Logger.info("FUN #{x}")
    "#{x}" <> " 02"
  end

  def fun_03(x) do
    Logger.info("FUN #{x}")
    "#{x}" <> " 03"
  end

  def fun_04(x) do
    Logger.info("FUN #{x}")
    "#{x}" <> " 04"
  end

  def fun_05(x) do
    Logger.info("FUN #{x}")
    "#{x}" <> " 05"
  end

  def fun_06(x) do
    Logger.info("FUN #{x}")
    "#{x}" <> " 06"
  end

  def fun_07(x) do
    Logger.info("FUN #{x}")
    "#{x}" <> " 07"
  end

  def fun_08(x) do
    Logger.info("FUN #{x}")
    "#{x}" <> " 08"
  end

  def fun_09(x) do
    Logger.info("FUN #{x}")
    "#{x}" <> " 09"
  end

  def fun_10(x) do
    Logger.info("FUN #{x}")
    "#{x}" <> " 10"
  end
end

defmodule FunctionPractice1 do
  require Logger

  def main() do
    x = fun_01("")
    x = fun_02(x)
    x = fun_03(x)
    x = fun_04(x)
    x = fun_05(x)
    x = fun_06(x)
    x = fun_07(x)
    x = fun_08(x)
    x = fun_09(x)
    fun_10(x)
  end

  # variable assign and again return value in the end

  def fun_01(x) do
    y = x <> " 01"
    Logger.info("FUN #{y}")
    y
  end

  def fun_02(x) do
    y = "#{x}" <> " 02"
    Logger.info("FUN #{y}")
    y
  end

  def fun_03(x) do
    y = "#{x}" <> " 03"
    Logger.info("FUN #{y}")
    y
  end

  def fun_04(x) do
    y = "#{x}" <> " 04"
    Logger.info("FUN #{y}")
    y
  end

  def fun_05(x) do
    y = "#{x}" <> " 05"
    Logger.info("FUN #{y}")
    y
  end

  def fun_06(x) do
    y = "#{x}" <> " 06"
    Logger.info("FUN #{y}")
    y
  end

  def fun_07(x) do
    y = "#{x}" <> " 07"
    Logger.info("FUN #{y}")
    y
  end

  def fun_08(x) do
    y = "#{x}" <> " 08"
    Logger.info("FUN #{y}")
    y
  end

  def fun_09(x) do
    y = "#{x}" <> " 09"
    Logger.info("FUN #{y}")
    y
  end

  def fun_10(x) do
    y = "#{x}" <> " 10"
    Logger.info("FUN #{y}")
    y
  end
end

defmodule FunctionPractice2 do
  require Logger

  def main() do
    fun_01("")
    |> fun_02()
    |> fun_03()
    |> fun_04()
    |> fun_05()
    |> fun_06()
    |> fun_07()
    |> fun_08()
    |> fun_09()
    |> fun_10()
  end

  # use Pipeoperator

  def fun_01(x) do
    y = x <> " 01"
    Logger.info("FUN #{y}")
    y
  end

  def fun_02(x) do
    y = "#{x}" <> " 02"
    Logger.info("FUN #{y}")
    y
  end

  def fun_03(x) do
    y = "#{x}" <> " 03"
    Logger.info("FUN #{y}")
    y
  end

  def fun_04(x) do
    y = "#{x}" <> " 04"
    Logger.info("FUN #{y}")
    y
  end

  def fun_05(x) do
    y = "#{x}" <> " 05"
    Logger.info("FUN #{y}")
    y
  end

  def fun_06(x) do
    y = "#{x}" <> " 06"
    Logger.info("FUN #{y}")
    y
  end

  def fun_07(x) do
    y = "#{x}" <> " 07"
    Logger.info("FUN #{y}")
    y
  end

  def fun_08(x) do
    y = "#{x}" <> " 08"
    Logger.info("FUN #{y}")
    y
  end

  def fun_09(x) do
    y = "#{x}" <> " 09"
    Logger.info("FUN #{y}")
    y
  end

  def fun_10(x) do
    y = "#{x}" <> " 10"
    Logger.info("FUN #{y}")
    y
  end
end
