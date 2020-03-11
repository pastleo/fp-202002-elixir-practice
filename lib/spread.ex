defmodule Spread do
  # 0 -> 1
  # 1 -> 3
  # 2 -> 5
  # 3 -> 3 * 2 + 5 = 11
  # 4 -> 5 * 2 + 11 = 21
  def infected(days) when days <= 0, do: 1
  def infected(1), do: 3
  def infected(2), do: 5
  def infected(days), do: infected(days - 2) * 2 + infected(days - 1)
  # calling infected(4), call stack will be:
  # -> infected(4)
  #   -> infected(2)
  #   <- 5
  #   -> infected(3)
  #     -> infected(1)
  #     <- 3
  #     -> infected(2)
  #     <- 5
  #   <- 11
  # <- 21

  # https://en.wikipedia.org/wiki/Fibonacci_number
  # 1, 1, 2, 3, 5, 8 ...
  def fib(n) when n <= 2, do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)
  # calling fib(4), call stack will be:
  # -> fib(4)
  #   -> fib(3)
  #     -> fib(2)
  #     <- 1
  #     -> fib(1)
  #     <- 1
  #   <- 2
  #   -> fib(1)
  #   <- 1
  # <- 3

  # tail call optimized fibonacci
  def fib_tco(n) when n < 1, do: 1
  def fib_tco(n), do: calc_fib_tco(1, 1, n)
  defp calc_fib_tco(a, _, 1), do: a
  defp calc_fib_tco(a, b, n), do: calc_fib_tco(b, a + b, n - 1)
  # calling fib_tco(4), call stack will be:
  # -> fib_tco(4)
  # -> calc_fib_tco(1, 1, 4)
  # -> calc_fib_tco(1, 2, 3)
  # -> calc_fib_tco(2, 3, 2)
  # -> calc_fib_tco(3, 5, 1)
  # <- 3

  # tail call optimized infected:
  def infected_tco(days) when days < 1, do: 1
  def infected_tco(days), do: calc_infected_tco(3, 5, days)
  defp calc_infected_tco(a, _, 1), do: a
  defp calc_infected_tco(a, b, days), do: calc_infected_tco(b, a * 2 + b, days - 1)
  # calling infected_tco(4), call stack will be:
  # -> infected_tco(4)
  # -> calc_infected_tco(3, 5, 4)
  # -> calc_infected_tco(5, 11, 3)
  # -> calc_infected_tco(11, 21, 2)
  # -> calc_infected_tco(21, 43, 1)
  # <- 21
end
