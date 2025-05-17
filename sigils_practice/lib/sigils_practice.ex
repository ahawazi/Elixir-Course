defmodule SigilsPractice do
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
    def sigil_l(string, []), do: String.downcase(string)
  end

  def custom_sigils do
    import MySigils
    [
      ~u(hello),  # "HELLO"
      ~l(WORLD)   # "world"
    ]
  end
  # استفاده:
  # import MySigils
  # ~u(hello)  # "HELLO"

  def s_example do
    name = "الی"
    # حروف کوچک - interpolation فعال
    # => "سلام الی"
    ~s(سلام #{name})
    # حروف بزرگ - interpolation غیرفعال
    # => "سلام \#{name}"
    ~S(سلام #{name})
  end

  def c_example do
    # حروف کوچک - کاراکترهای خاص تفسیر می‌شوند
    ~c(خط اول\nخط دوم)
    # => 'خط اول\nخط دوم' (کاراکتر \n تفسیر می‌شود)

    # حروف بزرگ - نمایش خام
    ~C(خط اول\nخط دوم)

    # => 'خط اول\\nخط دوم' (کاراکتر \n به صورت متن نمایش داده می‌شود)
  end

  def r_example do
    prefix = "ال"
    # حروف کوچک - interpolation فعال
    ~r/#{prefix}یکسیر/
    # => ~r/الیکسیر/

    # حروف بزرگ - interpolation غیرفعال
    ~R/#{prefix}یکسیر/
    # => ~r/\#{prefix}یکسیر/
  end

  def w_example do
    count = 2

    # حروف کوچک - interpolation فعال
    ~w(آیتم#{count} جدید)
    # => ["آیتم2", "جدید"]

    # حروف بزرگ - interpolation غیرفعال
    ~W(آیتم#{count} جدید)
    # => ["آیتم\#{count}", "جدید"]
  end

  def d_example do
    # فقط حروف بزرگ برای تاریخ وجود دارد
    # معتبر
    ~D[2023-12-25]
    # نامعتبر
    ~d[2023-12-25]
  end

  def hello do
    :world
  end
end
