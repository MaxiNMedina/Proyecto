class Residence < ApplicationRecord
	default_scope -> { order :name }
	has_many :auctions
	validates :image_url, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
end
