require 'spec_helper'

describe Rubmote::Spotify do
	before(:each) do
		stub_request(:get, "https://open.spotify.com/token").to_return(token_success)
	end

	subject { Rubmote::Spotify.new }

	let(:token_success) {
		File.new(File.join(RSpec.root, 'sample_responses', 'open.spotify.com', 'token', 'success.txt'))
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

	describe 'a new Spotify Instance' do

	end
    it 'gets a new token' do
      expect(subject.token).to eq('NAowChgKB1Nwb3RpZnkSABoGmAEByAEBJV1W7VgSFPLkH2iipjle98GYNEiBSFE-9Ymq')
    end
end
