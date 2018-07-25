class UserColor < ApplicationRecord
  belongs_to :user

  validates_presence_of :color_code,:row,:col, :user_id

  def self.update_user_colors(user, data)
  	grid_place = data[:grid_postion].split("-")[1].split("_")
  	user.user_colors.create(color_code: data[:color_code], row: grid_place[0],col: grid_place[1])
  end

  def self.get_existing_color_code_data(row, col, color_data)
    result = []
    user_color = color_data.select{ |data| data.row == row and data.col == col}.last
    result = [user_color.color_code,"#{user_color.user.name} #{user_color.time_format}"] if user_color.present?
    result
	end

	def time_format
    self.updated_at.strftime("%d-%m-%Y %H:%M:%S")
  end

end
