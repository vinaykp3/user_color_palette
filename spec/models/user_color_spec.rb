require 'rails_helper'

RSpec.describe UserColor, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:color_code) }
  it { should validate_presence_of(:row) }
  it { should validate_presence_of(:col) }

  describe '.update_user_colors' do
  	it 'should create the user color' do
  		user = FactoryBot.create(:user)
	  	data = {grid_postion: 'grd-1_1', color_code: '1234'}
	  	UserColor.update_user_colors(user, data)
	  	expect(UserColor.count).to eq(1)
  	end
  end

  describe '.get_existing_color_code_data' do
  	it 'should return the existing color data' do
  		user = FactoryBot.create(:user)
	  	user2 = FactoryBot.create(:user)
	  	user3 = FactoryBot.create(:user)
	  	one = FactoryBot.create(:user_color, user: user)
	  	two = FactoryBot.create(:user_color, user: user2)
	  	three = FactoryBot.create(:user_color, user: user3)
      colors = UserColor.includes(:user).group_by{|data| [data.row, data.col]}
	  	data = UserColor.get_existing_color_code_data(1,1, colors)
	  	expect(data[0]).to eq(three.color_code)
	  	expect(data[1]).to eq("#{user3.name} #{three.time_format}")
  	end
  	
  end
end