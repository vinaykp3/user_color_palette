class UserColor < ApplicationRecord
  belongs_to :user

  validates_presence_of :color_code,:row,:col, :user_id

  def self.update_user_colors(user, data)
  	grid_place = data[:grid_postion].split("-")[1].split("_")
  	user.user_colors.create(color_code: data[:color_code], row: grid_place[0],col: grid_place[1])
  end
end
