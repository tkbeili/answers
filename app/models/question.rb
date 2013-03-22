class Question < ActiveRecord::Base
  attr_accessible :body, :title

  validates :title, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy

  has_many :likes
  has_many :users, through: :likes

end
