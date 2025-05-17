defmodule SigilsPractice do
  @moduledoc """
  Documentation for `SigilsPractice`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> SigilsPractice.hello()
      :world

  """
  def string_examples do
    ~s(این یک رشته است با "دابل کوتیشن")
    # معادل: "این یک رشته است با \"دابل کوتیشن\""
  end

  def charlist_examples do
    ~c(لیست کاراکترها)
    # معادل: 'لیست کاراکترها'
  end

  def word_list do
    ~w(سلام دنیای الیکسیر)
    # نتیجه: ["سلام", "دنیای", "الیکسیر"]

    ~w(سلام 42 true)a
    # [:سلام, 42, true]

  end

  def regex_example do
    regex = ~r/elixir/i
    "Elixir is great" =~ regex
    # true
  end

  def date_example do
    ~D[2023-12-25]
    # %Date{year: 2023, month: 12, day: 25}
  end

  defmodule MySigils do
    def sigil_u(string, []), do: String.upcase(string)
  end
  # استفاده:
  # import MySigils
  # ~u(hello)  # "HELLO"

  def date_example do
    ~D[2023-12-25]
    # %Date{year: 2023, month: 12, day: 25}
  end

  def hello do
    :world
  end
end
