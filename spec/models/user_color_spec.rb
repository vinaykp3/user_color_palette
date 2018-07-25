require 'rails_helper'

RSpec.describe UserColor, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:color_code) }
  it { should validate_presence_of(:row) }
  it { should validate_presence_of(:col) }

  describe 'update_user_colors' do
  	it 'should create the user color' do
  		user = FactoryBot.create(:user)
	  	data = {grid_postion: 'grd-1_1', color_code: '1234'}
	  	UserColor.update_user_colors(user, data)
	  	expect(UserColor.count).to eq(1)
  	end
  	
  end
end