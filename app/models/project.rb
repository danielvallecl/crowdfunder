class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges
  has_many :rewards

  accepts_nested_attributes_for :rewards
end
