class Option < ActiveRecord::Base
  belongs_to :word
  has_one :answer

  validates :content, presence: true

  scope :wrong_options, ->{where(correct: false).order("RAND()").limit(3)}
  scope :correct_option, ->{order("RAND()").find_by correct: true}
end
