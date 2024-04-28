class Role < ApplicationRecord
  has_many :team_roles
  has_many :teams, through: :team_roles
  has_many :users, through: :team_roles
end
