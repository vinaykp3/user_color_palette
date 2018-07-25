class LeaderBoardController < ApplicationController
  before_action :set_user

  def index
  end

  def update_user_grid_color
  	params.permit!
  	UserColor.update_user_colors(@user, params.to_h)
    respond_to :js
  end

  private

  def set_user
  	@user = User.set_user(request.remote_ip)
  end
end
