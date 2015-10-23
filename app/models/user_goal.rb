class UserGoal < ActiveRecord::Base
    belongs_to :user
    validates :numbers_of_words, :presence => true
    validate :valid_dates
    before_save :assign_userId
    
    def valid_dates
        if start_time >= end_time
            self.errors.add :start_time, ' must before end time'
        end
    end
    
    private
    def assign_userId
        self.user_id = User.current_user.id
    end
end
