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
		get_particle_variable("on") == 1
	end

	def power_level
		get_particle_variable("power")
	end

end
