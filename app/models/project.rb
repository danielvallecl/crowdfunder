class Project < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'project_id'
  has_many :pledges
  has_many :rewards

  accepts_nested_attributes_for :rewards

  validate :future_project

  def future_project
		the_date = self.start_date
		if the_date < DateTime.now
			errors.add(:date, ": Your project cannot occur in the past")
		end
	end	  

	def recent_pledges
  	self.pledges.order(created_at: :desc)
  end

  # def total_pledge_amount
  # 	project.pledges.amount.reduce(:+)
  # end
end
