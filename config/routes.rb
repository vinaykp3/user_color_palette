Rails.application.routes.draw do
  root :to => "leader_board#index"
  post '/leader_board/update_user_grid_color'
  get '/leader_board/frequent_grid_updatation'
end
