module ApplicationHelper
  def hour_minute_display(a_date)
    if a_date.hour > 12
      return "下午 #{a_date.hour - 12}:#{a_date.strftime('%M')}"
    else
      return "上午#{a_date.strftime('%k:%M')}"
    end
  end
end
