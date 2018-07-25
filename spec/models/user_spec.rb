require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should have_many(:user_colors).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:uniq_identifier) }

  describe 'create or return user' do
  	it 'should create the user if user not exist' do
  		user = User.set_user('1234')
  		expect(User.count).to eq(1)
		end

		it 'should return the user if user exist' do
			user = FactoryBot.create(:user, uniq_identifier: '1234')
  		user = User.set_user('1234')
  		expect(User.count).to eq(1)
		end
  end

end