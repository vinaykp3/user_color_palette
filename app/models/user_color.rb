class UserColor < ApplicationRecord
  belongs_to :user

  validates_presence_of :color_code,:row,:col, :user_id

  def self.update_user_colors(user, data)
  	row, column = data[:grid_postion].split("-")[1].split("_")
  	user.user_colors.create(color_code: data[:color_code], row: row,col: column)
  end

  def self.get_existing_color_code_data(row, col, color_data)
    user_color = color_data[[row, col]].try(:last)
    return [] if user_color.blank?
    [user_color.color_code,"#{user_color.user.name} #{user_color.time_format}"]
	end

	def time_format
    self.updated_at.strftime("%d-%m-%Y %H:%M:%S")
  end

end
