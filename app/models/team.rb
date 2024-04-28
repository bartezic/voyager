class Team < ApplicationRecord
  # Association with the User model for the owner
  belongs_to :owner, class_name: 'User'

  # Association with TeamRole model
  has_many :team_roles
  has_many :roles, through: :team_roles
  has_many :users, through: :team_roles
end
