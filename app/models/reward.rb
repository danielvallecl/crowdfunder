class Reward < ApplicationRecord
	belongs_to :project

	validates :description, presence: true
end
