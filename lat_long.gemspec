# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lat_long/version'

Gem::Specification.new do |spec|
  spec.name          = "lat_long"
  spec.version       = LatLong::VERSION
  spec.authors       = ["Matis Masters"]
  spec.email         = ["matis@craftedcode.com"]

  spec.summary       = %q{Move Lat, Long, coordinates using distance and direction.}
  spec.description   = %q{LatLong::Point.new(32.000, -41.000).move(5, :miles, :north) => [lat: 32.333, long: -41.000]}
  spec.homepage      = "https://github.com/matismasters/lat_long"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "reek"
end
