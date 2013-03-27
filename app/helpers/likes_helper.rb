module LikesHelper
  def formatted_date(date)
    date.strftime(" in likes - %d %b %Y")
  end
end
