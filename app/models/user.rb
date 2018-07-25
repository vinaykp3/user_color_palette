class User < ApplicationRecord
	has_many :user_colors, dependent: :destroy
	validates_presence_of :name, :uniq_identifier
end
