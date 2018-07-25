class LeaderBoardController < ApplicationController
  before_action :set_user

  def index
  end

  private

  def set_user
  	@user = User.set_user(request.remote_ip)
  end
end
