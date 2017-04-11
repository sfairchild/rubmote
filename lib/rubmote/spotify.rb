require 'httparty'

module Rubmote
	class Spotify
		include HTTParty
		attr_reader :token, :csrf_token

		PORT = 4370
		DEFAULT_RETURN_ON = ['login', 'logout', 'play', 'pause', 'error', 'ap']
		ORIGIN_HEADER = {'Origin': 'https://open.spotify.com'}

		def initialize
			@token			= get_token
			@csrf_token = get_csrf_token
		end

		private
		def get_token
			JSON.parse(self.class.get('https://open.spotify.com/token').body)['t']
		end

		def get_csrf_token
			request = JSON.parse(self.class.get("#{ local_url }/simplecsrf/token.json").body)
			raise NotLoggedInError unless request['token']
			request['token']
		end

		def local_url
			"https://#{ random_localhost }.spotilocal.com:4370"
		end

		def random_localhost
			10.times.map { ([*'a'..'z']).sample }.join
		end

		class NotLoggedInError < StandardError; end
	end
end
