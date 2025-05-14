defmodule PrimeCheckerWeb.PrimeController do
  use PrimeCheckerWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def check(conn, %{"number" => number}) do
    num = String.to_integer(number)
    result = if is_prime(num), do: "عدد اول است ✅", else: "عدد اول نیست ❌"
    render(conn, :index, number: num, result: result)
  end

 defp is_prime(n) when n <= 1, do: false
defp is_prime(2), do: true
defp is_prime(n) do
  limit = :math.sqrt(n) |> floor
  Enum.all?(2..limit, fn i -> rem(n, i) != 0 end)
end

end
