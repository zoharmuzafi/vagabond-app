class User < ActiveRecord::Base

	has_secure_password

	belongs_to :city
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

end

