defmodule Example do
  @moduledoc """
  نمایش کلیه سیگیل‌های استاندارد الیکسیر با مثال‌های اجرایی
  """

  # 1. سیگیل‌های رشته‌ای
  def string_sigils do
    name = "الی"
    [
      regular: ~s(سلام #{name}),
      raw: ~S(سلام \#{name}),
      heredoc: """
      متن چندخطی
      با قابلیت Interpolation: #{1 + 1}
      """,
      raw_heredoc: '''
      متن چندخطی خام
      بدون Interpolation: \#{1 + 1}
      '''
    ]
  end

  # 2. سیگیل لیست کاراکترها
  def charlist_sigils do
    [
      regular: ~c(کاراکتر\nخاص),
      raw: ~C(کاراکتر\nخاص)
    ]
  end

  # 3. سیگیل لیست کلمات
  def wordlist_sigils do
    count = 2
    [
      strings: ~w(آیتم#{count} جدید),
      atoms: ~w(آیتم#{count} جدید)a,
      raw: ~W(آیتم#{count} جدید)
    ]
  end

  # 4. سیگیل عبارات باقاعده
  def regex_sigils do
    prefix = "el"
    [
      case_sensitive: ~r/#{prefix}ixir/,
      case_insensitive: ~r/#{prefix}ixir/i
    ]
  end

  # 5. سیگیل‌های تاریخ و زمان
  def datetime_sigils do
    [
      date: ~D[2023-12-25],
      time: ~T[15:30:00],
      naive_datetime: ~N[2023-12-25 15:30:00],
      utc_datetime: ~U[2023-12-25 15:30:00Z]
    ]
  end

  # 6. ماژول سیگیل سفارشی
  defmodule CustomSigils do
    def sigil_reverse(string, []), do: String.reverse(string)
    def sigil_upper(string, []), do: String.upcase(string)
  end

  # 7. استفاده از سیگیل‌های سفارشی
  def custom_sigils do
    import CustomSigils
    [
      reverse: ~r/سلام/,
      upper: ~u/hello/
    ]
  end

  # تابع اصلی برای تست
  def demo do
    %{
      strings: string_sigils(),
      charlists: charlist_sigils(),
      wordlists: wordlist_sigils(),
      regexes: regex_sigils(),
      datetimes: datetime_sigils(),
      customs: custom_sigils()
    }
  end
end
