require 'httparty'

module Rubmote
	class Spotify
		include HTTParty
		attr_reader :token, :csrf_token

		base_uri 'https://open.spotify.com/'

		def initialize
			@token = get_token
		end

		private
		def get_token
			JSON.parse(self.class.get('/token').body)['t']
		end
	end
end
