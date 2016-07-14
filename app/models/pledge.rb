class Pledge < ApplicationRecord
  belongs_to :project
  belongs_to :user
  
  def total_pledge_amount
  	project.pledges.amount.reduce(:+)
  end
end
