class QuestionsMailer < ActionMailer::Base
  default from: "do-not-reply@answerawesome.com"

  def answer_notfication(user, question)
    @user = user
    @question = question
    mail(to: user.email, subject: "You've got new answer!")
  end

end