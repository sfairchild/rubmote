require 'spec_helper'

describe Rubmote::Spotify do
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
end
