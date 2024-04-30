class Cabinet::PagesController < Cabinet::BaseController
  before_action :set_current_team

  def home
  end

  private

  def set_current_team
    team_id = params[:current_team_id]
    if current_user.teams.exists?(team_id)
      session[:current_team_id] = team_id
    end
  end
end
