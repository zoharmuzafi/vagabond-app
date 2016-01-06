class User < ActiveRecord::Base

  extend FriendlyId
  friendly_id :username, use: [:slugged, :history]

	has_secure_password

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true, length: { minimum: 6 }
  # validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, length: { minimum: 8 }, on: :create

	belongs_to :city
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	def self.sign_in_from_omniauth(auth)
		find_by(provider: auth['provider'], uid: auth['uid'])|| create_user_from_omniauth(auth)
	end

	def self.create_user_from_omniauth(auth)
		create(
			  provider: auth["provider"],
		    uid: auth["uid"],
		    name: auth["info"]["name"],
		    email: auth["info"]["email"],
		    password: FFaker::Internet.password,
		    username: "#{(auth["info"]["name"]).delete(' ')}#{FFaker::PhoneNumberAU.home_work_phone_prefix}",
		    avatar: auth["info"]["image"]
		)
  	end

  mount_uploader :avatar, AvatarUploader

end

