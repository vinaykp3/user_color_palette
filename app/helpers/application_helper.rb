module ApplicationHelper
	
	def generate_grid(row,col)
    color_data = fetch_color_info(row, col)
    raw("<div class='content' onclick='update_grid_color(this);'
         id='grid-#{row}_#{col}' style= 'background-color: #{color_data[0]}'></div>")
  end

  def fetch_color_info(row, col)
  	UserColor.get_existing_color_code_data(row, col, @user_color)
  end

end
