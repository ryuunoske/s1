class Task < ActiveRecord::Base
	validates_presence_of :title
	validate :future_completed_date
	#Task Belongs to user and Checks tasks for each user
	belongs_to :user
	validates_presence_of :user
	#comment for end
	private
	
		def future_completed_date
    		if !completed_on.blank? && completed_on > Date.today
      		self.errors.add(:completed, "can't be in the future")
		end
  	end
end