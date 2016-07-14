class Reward < ApplicationRecord
	belongs_to :project

	validate :description, presence: true
end
