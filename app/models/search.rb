class Search < ApplicationRecord

	def search_residences
		residences = Residence.all

		residences = residences.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
		residences = residences.where(["dir LIKE ?","%#{dir}%"]) if dir.present?
		#residences = residences.where(["desc LIKE ?","%#{desc}%"]) if desc.present?
		residences = residences.where(["country LIKE ?","%#{country}%"]) if country.present?
		residences = residences.where(["province LIKE ?","%#{province}%"]) if province.present?
		residences = residences.where(["locality LIKE ?","%#{locality}%"]) if locality.present?

		return residences
	end
end
