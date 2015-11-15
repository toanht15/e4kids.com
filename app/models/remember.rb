class Remember < ActiveRecord::Base
	belongs_to :user
	belongs_to :vocabulary
	validates :user_id, presence: true
	validates :vocabulary_id, presence: true
	validates :user_id, uniqueness: { scope: :vocabulary_id }

end
