class Reward < ActiveRecord::Base

  belongs_to :project
  belongs_to :user, through :project

end
