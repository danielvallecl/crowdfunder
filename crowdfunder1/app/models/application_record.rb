class ApplicationRecord < ActiveRecord::Base
	include CanCan::ControllerAdditions
  self.abstract_class = true
end
