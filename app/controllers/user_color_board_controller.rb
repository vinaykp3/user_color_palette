class UserColorBoardController < ApplicationController
  before_action :set_user
  before_action :user_color_data, only: [:index, :frequent_grid_updatation]

  def index
  end

  def update_user_grid_color
  	UserColor.update_user_colors(@user, user_params)
    respond_to :js
  end

  def frequent_grid_updatation
  	respond_to :js
  end

  def leader_board
  	@users_data = User.users_colors_data
  end

  private

  def set_user
  	@user = User.set_user(request.remote_ip)
  end

  def user_color_data
  	@user_color ||= UserColor.includes(:user).group_by{|data| [data.row, data.col]}
  end

  def user_params
    params.require(:user_color).permit(:grid_postion, :color_code)
  end
end
