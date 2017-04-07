# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spotify/rubmote/version'

Gem::Specification.new do |spec|
  spec.name          = 'spotify-rubmote'
  spec.version       = Spotify::Rubmote::VERSION
  spec.authors       = ['Sean Fairchild']
  spec.email         = ['seanf215@gmail.com']

  spec.summary       = %q{A simple ruby interface to controlling a spotify desktop client.}
  spec.description   = %q{A small project for controlling a spotify desktop client based on the writeup at http://cgbystrom.com/articles/deconstructing-spotifys-builtin-http-server/}
  spec.homepage      = 'https://github.com/sfairchild/spotify-rubmote'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split('\x0').reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.14'
	
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
end
