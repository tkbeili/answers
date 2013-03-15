class Answer < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, presence: true, uniqueness: true

  before_validation :print_me_something

  scope :ordered_by_title, order("title ASC")
  scope :with_empty_content, where(content: "")

  private

  def print_me_something
    puts "something"
  end

end