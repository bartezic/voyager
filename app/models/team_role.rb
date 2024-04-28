class TeamRole < ApplicationRecord
  belongs_to :team
  belongs_to :role
  belongs_to :user
end
