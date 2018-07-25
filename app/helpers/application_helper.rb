module ApplicationHelper
	
	def generate_grid(row,col)
    raw("<div class='content' onclick='update_grid_color(this);'
         id='grid-#{row}_#{col}'></div>")
  end

end
