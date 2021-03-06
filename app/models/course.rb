class Course < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :users, through: :lessons
  has_many :words, dependent: :destroy

  validates :name, presence: true
end
