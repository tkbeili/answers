module AnswersHelper
  def formatted_date(date)
    date.strftime("in answers - %d %b %Y")
  end
end
