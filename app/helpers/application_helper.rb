module ApplicationHelper
  def hour_minute_display(a_date)
    if a_date.hour > 12
      return "下午 #{a_date.hour - 12}:#{a_date.strftime('%M')}"
    else
      return "上午#{a_date.strftime('%k:%M')}"
    end
  end

  def date_display(a_date)
    a_date.month.to_s + "月" + a_date.day.to_s + "日" + hour_minute_display(a_date)
  end
end
