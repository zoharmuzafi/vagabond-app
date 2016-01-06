class City < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

	has_many :users
  has_many :posts

end
