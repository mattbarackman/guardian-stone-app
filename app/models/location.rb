class Location < ActiveRecord::Base

	belongs_to :device

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode  # auto-fetch address

	def google_map_url
		"http://www.google.com/maps/place/#{address}/@#{latitude},#{longitude},16z"
	end

end
