class Answers::MailHandler


  def send_mail(question_id, user_id )
    question = Question.find question_id
    user     = User.find user_id
    QuestionsMailer.answer_notfication(user, question).deliver
  end
  handle_asynchronously :send_mail, :priority => 20


end

