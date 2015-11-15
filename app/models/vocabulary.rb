class Vocabulary < ActiveRecord::Base
  belongs_to :subject
  has_many :remembers
  has_many :users, through: :remembers
end
