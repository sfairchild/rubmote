#! /usr/bin/env ruby

require 'httparty'
class Spotify
	include HTTParty
	attr_reader :oauth_token, :csrf_token

	FAKE_AGENT = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36'
	base_uri 'https://open.spotify.com/'

	def initialize
		@oauth_token = get_oauth_token

	end

	def get_status


	end

	private
		def get_oauth_token
			JSON.parse(get_json_request('/token').body)['t']
		end

		def get_json_request(uri, params: {}, headers: {})

			headers['User-Agent'] ||= FAKE_AGENT
			self.class.get(uri, timeout: 10, params: params, headers: headers)
		end
end

