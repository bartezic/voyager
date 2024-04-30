class Cabinet::BaseController < ApplicationController
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!
end
