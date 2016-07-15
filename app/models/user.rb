class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :pledges
  has_many :projects, through: :pledges
  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id'

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true

  def upcoming_projects
  	self.projects.order(start_date: :desc)
  end

  def recent_pledges
  	self.pledges.order(created_at: :desc)
  end
end
