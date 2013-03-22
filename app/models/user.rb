class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :questions

  has_many :likes
  has_many :liked_questions, through: :likes, source: :question

  def has_liked?(question)
    liked_questions.include?(question)
  end

  def like_for(question)
    likes.where(question_id: question.id).first
  end

end