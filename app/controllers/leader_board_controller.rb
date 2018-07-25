class LeaderBoardController < ApplicationController
  before_action :set_user
  before_action :user_color_data, only: [:index, :frequent_grid_updatation]

  def index
  end

  def update_user_grid_color
  	params.permit!
  	UserColor.update_user_colors(@user, params.to_h)
    respond_to :js
  end

  def frequent_grid_updatation
  	respond_to :js
  end

  private

  def set_user
  	@user = User.set_user(request.remote_ip)
  end

  def user_color_data
  	@user_color ||= UserColor.includes(:user)
  end
end
