Rails.application.routes.draw do
  root :to => "user_color_board#index"
  post '/user_color_board/update_user_grid_color'
  get '/user_color_board/frequent_grid_updatation'
  get '/user_color_board/leader_board'
end
