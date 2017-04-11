require 'spec_helper'

describe Rubmote::Spotify do
	before(:each) do
		stub_request(:get, "https://open.spotify.com/token").to_return(token_success)
		stub_request(:get, /[a-z]{10}\.spotilocal\.com\:4370\/simplecsrf\/token\.json/).to_return(csrf_token_success)
	end

	subject { Rubmote::Spotify.new }

	let(:token_success) {
		File.new(File.join(RSpec.root, 'sample_responses', 'open.spotify.com', 'token', 'success.txt'))
	}

	let(:csrf_token_success) {
		File.new(File.join(RSpec.root, 'sample_responses', 'spotilocal.com', 'token.json', 'success.txt'))
	}

  it 'has a token reader method' do
    expect(Rubmote::Spotify.method_defined?(:token)).to be true
  end

  it 'has a csrf_token reader method' do
    expect(Rubmote::Spotify.method_defined?(:csrf_token)).to be true
  end

  it 'does not have a token writer method' do
    expect(Rubmote::Spotify.method_defined?(:'token=')).to be false
  end

  it 'does not have a csrf_token writer method' do
    expect(Rubmote::Spotify.method_defined?(:'csrf_token=')).to be false
  end

	it 'gets an random localhost' do
		random_host = subject.send(:random_localhost)
		expect(random_host).to match(/[a-z]{10}/)
	end

  describe '#initialize' do

    it 'gets a new token' do
      expect(subject.token).to eq('NAowChgKB1Nwb3RpZnkSABoGmAEByAEBJV1W7VgSFPLkH2iipjle98GYNEiBSFE-9Ymq')
    end

    it 'gets a new csrf token' do
      expect(subject.csrf_token).to eq('f18505af00afa8d4014a9fef3a4c6a9f')
    end
  end
end
