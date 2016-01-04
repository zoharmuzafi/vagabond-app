class User < ActiveRecord::Base

	belongs_to :city
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

end
