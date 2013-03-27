module ApplicationHelper
  def formatted_date(date)
    date.strftime("in application %d %b %Y")
  end
end
