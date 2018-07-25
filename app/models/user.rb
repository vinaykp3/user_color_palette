class User < ApplicationRecord
	has_many :user_colors, dependent: :destroy
	validates_presence_of :name, :uniq_identifier

	def self.set_user(ipaddress)
		user = User.find_by(uniq_identifier: ipaddress)
    return user if user
  	user_name = "RandomUser_#{SecureRandom.hex(10)}"
  	User.create(name: user_name, uniq_identifier: ipaddress)
	end
end
