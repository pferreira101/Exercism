defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.compare(~T[12:00:00])
    |> Kernel.==(:lt)
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29

    NaiveDateTime.add(checkout_datetime, days, :day)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_datetime
    |> NaiveDateTime.to_date()
    |> Date.diff(planned_return_date)
    |> then(fn d -> if d < 0, do: 0, else: d end)
  end

  def monday?(datetime) do
    date = datetime |> NaiveDateTime.to_date()

    date
    |> Date.beginning_of_week()
    |> Date.diff(date)
    |> Kernel.==(0)
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_return_date = return_date(datetime_from_string(checkout))
    return_date = datetime_from_string(return)
    days_late(checkout_return_date, return_date) * rate
    |> then(fn rate -> if monday?(return_date), do: Kernel.trunc(rate / 2), else: rate end)
  end
end
