require 'httparty'

module Rubmote
	class Spotify
		include HTTParty
		attr_reader :token, :csrf_token

		base_uri 'https://open.spotify.com/'

		def initialize
			@token			= get_token
			@csrf_token = get_csrf_token
		end

		private
		def get_token
			JSON.parse(self.class.get('/token').body)['t']
		end

		def get_csrf_token
			JSON.parse(self.class.get("https://#{ random_localhost }.spotilocal.com:4370/simplecsrf/token.json").body)['token']
		end

		def random_localhost
			10.times.map { ([*'a'..'z']).sample }.join
		end
	end
end
