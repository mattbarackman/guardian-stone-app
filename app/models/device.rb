class Device < ActiveRecord::Base

	has_many :pings

	def particle_endpoint
		"https://api.particle.io/v1/devices/#{particle_id}/"
	end

	def post_particle_function!(command)
		RestClient.post(
			particle_endpoint + command,
			:access_token => access_token
			)
	end

	def get_particle_variable(command)
		resp = RestClient.get(
			particle_endpoint + command,
				{
					:params => {
						:access_token => access_token
					}
				}
			)
		JSON.parse(resp)["result"]
	end


	def turn_on!
		post_particle_function!("turnon")
	end

	def turn_off!
		post_particle_function!("turnoff")
	end

	def on?
		get_particle_variable("O") == 1
	end

	def power_level
		get_particle_variable("P")
	end

	def coords
		@coords ||= get_particle_variable("L")
	end

	def location
		if coords.blank?
			nil
		else
			@location ||= Geocoder.search(coords).first.formatted_address
		end
	end

	def coords_time
		if coords.blank?
			nil
		else
			Time.at(get_particle_variable("T")).to_datetime
		end
	end


end
