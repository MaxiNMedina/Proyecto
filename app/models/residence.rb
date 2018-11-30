class Residence < ApplicationRecord
	default_scope -> { order :name }
	has_many :auctions
	has_many :reservations
	has_many :availabilities, dependent: :destroy
	validates :image_url, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }

<<<<<<< HEAD
	def self.search(search)
		if search
			where(["name LIKE ?", "%#{search}%"])
		else
			all
		end
	end
=======
  scope :open, -> {where(available: 1)}
  scope :closed, -> {where(available: 0)}
>>>>>>> c64a68c7703a66caebbe95014f8cd402c850d6c9
end
