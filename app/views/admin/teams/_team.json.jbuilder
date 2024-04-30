json.extract! team, :id, :name, :description, :owner_id, :created_at, :updated_at
json.url admin_team_url(team, format: :json)
