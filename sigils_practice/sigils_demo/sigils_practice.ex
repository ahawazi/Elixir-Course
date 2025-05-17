defmodule SigilsPractice do
  def string_examples do
    ~s(این یک رشته است با "دابل کوتیشن")
  end

  def charlist_examples do
    ~c(لیست کاراکترها)
  end

  def word_list do
    list1 = ~w(سلام دنیای الیکسیر)
    list2 = ~w(سلام true world)a
    {list1, list2}
  end

  def regex_example do
    regex = ~r/elixir/i
    "Elixir is great" =~ regex
  end

  def date_example do
    ~D[2023-12-25]
  end

  defmodule MySigils do
    def sigil_u(string, []), do: String.upcase(string)
    def sigil_l(string, []), do: String.downcase(string)
  end

  def custom_sigils do
    import MySigils
    [
      ~u(hello),  # "HELLO"
      ~l(WORLD)   # "world"
    ]
  end

  def s_example do
    name = "الی"
    small = ~s(سلام #{name})
    big   = ~S(سلام #{name})
    {small, big}
  end

  def c_example do
    small = ~c(خط اول\nخط دوم)
    big = ~C(خط اول\nخط دوم)
    {small, big}
  end

  def r_example do
    prefix = "ال"
    small = ~r/#{prefix}یکسیر/
    big = ~R/#{prefix}یکسیر/
    {small, big}
  end

  def w_example do
    count = 2
    small = ~w(آیتم#{count} جدید)
    big = ~W(آیتم#{count} جدید)
    {small, big}
  end

  def d_example do
    valid = ~D[2023-12-25]
    valid
  end

  def hello do
    :world
  end
end
