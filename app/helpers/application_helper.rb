module ApplicationHelper
	
	def generate_grid(row,col)
    raw("<div class='content' 
         id='grid-#{row}_#{col}'></div>")
  end

end
