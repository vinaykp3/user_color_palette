require 'rails_helper'

RSpec.describe UserColorBoardController, type: :controller do

  describe '#index' do
    it 'should return success' do
      get :index
      expect(response.status).to eql(200)
    end
  end

  describe '#leader_board' do
    it 'should return success' do
      get :leader_board
      expect(response.status).to eql(200)
    end

    it 'should set the user colors data' do
      user = FactoryBot.create(:user)
      user_color = FactoryBot.create(:user_color, user: user)
      allow(User).to receive(:users_colors_data).and_return(user_color)
      get :leader_board
      expect(assigns(:users_data)).to eql(user_color)
    end
  end

  describe '#frequent_grid_updatation' do
    it 'should return success' do
      get :frequent_grid_updatation, xhr: true
      expect(response.status).to eql(200)
    end
  end

  describe '#frequent_grid_updatation' do
    it 'should return success' do
      user = FactoryBot.create(:user)
      data = { user_color: {grid_postion: 'grid-1_2', color_code: '#12234'} }
      put :update_user_grid_color, params: data, xhr: true
      expect(response.status).to eql(204)
      expect(UserColor.count).to eq(1)
    end
  end

  


end