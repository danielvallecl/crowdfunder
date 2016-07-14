class Project < ApplicationRecord
  belongs_to :user
  has_many :pledges
  has_many :rewards

  accepts_nested_attributes_for :rewards	

  validate :future_project

  def future_project
		the_date = self.date
		if the_date < DateTime.now
			errors.add(:date, ": Your project occur in the past")
		end
	end	  
end
