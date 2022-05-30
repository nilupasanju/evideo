# 17/10/19
defmodule Modaya do
  require Logger

  def booruwa() do
    _nilupa = "/home/nilu/Documents/test/nilupa.txt"
    Logger.info("hi Nilupa")
  end
end

defmodule Times do
  require Logger

  def double(n) do
    Logger.info("hi double")
    n * 2
  end

  def triple(n) do
    Logger.info("hi triple")
    n * 3
  end

  def quadruple(n) do
    Logger.info("hi quadruple")
    n * 4
  end
end

# Named Function 29/10/19
require Logger

defmodule Greeter do
  def greet(greeting, name) do
    Logger.info(greeting)
    Logger.info("How are you doing, #{name}")
  end

  def hello() do
    "Hello annoymus"
  end

  def hello(name) do
    "hello, " <> name
  end

  def hello(name1, name2) do
    "hello,  #{name1} and #{name2}"
  end
end

defmodule Greeter1 do
  def hello(%{name: person_name}) do
    "hello, " <> person_name
  end
end

require Logger

defmodule Factorial do
  def of(0) do
    Logger.info("hi 1")
    1
  end

  def of(n) do
    Logger.info(fn -> "test #{n}" end)
    n * of(n - 1)
  end
end

require Logger
# defmodule BadFactorial do
#   def of(n), do: n * of(n-1)
#   def of(0), do: 1
# end

require Logger

defmodule Guard do
  def what_is(x) when is_number(x) do
    "#{x} is a number"
  end

  def what_is(x) when is_list(x) do
    Logger.info("#{inspect(x)} is a list")
  end

  def what_is(x) when is_atom(x) do
    Logger.info("#{x} is an atom")
  end
end

# Default Parameters 19/10/30

require Logger

defmodule Example2 do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    [p1, p2, p3, p4]
  end
end

# Pattern Matchhing

require Logger

defmodule Fruits do
  def i_need_some_fruits(fruits) do
    [apples, oranges | _] = fruits
    Logger.info("I am not comparing #{apples} and #{oranges} here")
  end
end

# Modules 31/10/19

defmodule FizzBuzz do
  defmodule MyIO do
    def print(_content) do
      content = ["apples"]
      IO.puts(content)
    end
  end

  def print do
    IO.puts("FizzBuzz")
  end
end

defmodule Outer do
  defmodule Inner do
    def inner_func do
      IO.puts("inner_func")
    end
  end

  def outer_func do
    IO.puts("outer_func")
  end
end

# Module Attributes

# defmodule Example3 do
#   #@author "Dave Thomas"
#   def get_author do
#     @author
#     Logger.info "Example was written by #{@author}"
#   end
# end

# Directives for Modules
# IMPORT

# defmodule FizzBuzz do
#   def fizz() do
#     "Fizz"
#   end

#   def buzz() do
#     "Buzz"
#   end
# end

# defmodule FizzBuzzUser do
#   import FizzBuzz

#   def fizz_buzz() do
#     "#{fizz}#{buzz}"
#   end
# end

# defmodule Math do
#   def some_function do
#     import List, only: [duplicate: 2]
#     duplicate(:ok, 10)
#   end
# end

# ALIAS

defmodule Sayings.Greetings do
  def basic(name) do
    "Hi, #{name}"
  end
end

defmodule Example1 do
  alias Sayings.Greetings

  def greeting(name) do
    Greetings.basic(name)
  end
end

defmodule Stats do
  # alias Math.List
  # In the remaining module definition List expands to Math.List.
end

# defmodule Math do
#   def plus(_a, _b) do
#     #alias Math.List
#     # ...
#   end

#   def minus(_a, _b) do
#     # ...
#   end
# end
# In the example above, since we are invoking alias inside the function plus/2,
# the alias will be valid only inside the function plus/2. minus/2 won’t be affected at all.

# Lists

defmodule MyList do
  def len([]) do
    0
  end

  def len([_head | tail]) do
    1 + len(tail)
  end

  def square([]) do
    []
  end

  def square([head | tail]) do
    [head * head | square(tail)]
  end

  def add_1([]) do
    []
  end

  def add_1([head | tail]) do
    [head + 1 | add_1(tail)]
  end
end

# Recursion

defmodule Recursion do
  def print_multiple_times(msg, n) when n <= 1 do
    Logger.info("#{msg}")
  end

  def print_multiple_times(msg, n) do
    Logger.info("#{msg}")
    print_multiple_times(msg, n - 1)
  end
end
