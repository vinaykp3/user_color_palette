class User < ApplicationRecord
    has_many :user_colors, dependent: :destroy
    validates_presence_of :name, :uniq_identifier

    def self.set_user(ipaddress)
      user = User.find_by(uniq_identifier: ipaddress)
      return user if user
      user_name = "RandomUser_#{SecureRandom.hex(10)}"
      User.create(name: user_name, uniq_identifier: ipaddress)
    end

    def self.users_colors_data
      User.joins(:user_colors).select("users.name as user_name, count(user_colors.id) most_color").group("users.name")
    end

  def user_favourite_color
    self.user_colors.group(:color_code).count.sort_by {|key,value| value}.last[0]
  end

end
