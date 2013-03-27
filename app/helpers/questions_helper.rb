module QuestionsHelper
  def formatted_date(date)
    date.strftime(" in question - %d %b %Y")
  end  
end