class User < ActiveRecord::Base
	cattr_accessor :current_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :user_logs
  has_many :user_goal
  has_many :active_relationships, class_name:  "Relationship",
  								foreign_key: "follower_id",
  								dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
  								foreign_key: "followed_id",
  								dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :remembers
  has_many :vocabulary, through: :remembers

   # Follows a user.
   def follow(other_user)
   	active_relationships.create(followed_id: other_user.id)
   end

  # Unfollows a user.
  def unfollow(other_user)
  	active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
  	following.include?(other_user)
  end   

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ? or email like ?", "%#{query}%", "%#{query}%") 
  end                            
end
