# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tvcom_toptwenty/version'

Gem::Specification.new do |spec|
  spec.name          = "tvcom_toptwenty"
  spec.version       = TvcomTopTwenty::VERSION
  spec.authors       = ["michaelsimon"]
  spec.email         = ["michael.simon@gmail.com"]

  spec.summary       = "A CLI Scraper Tool of TV.com's Shows Information"
  spec.description   = "TV.com Top Twenty provides a user with a listing of the top twenty shows across all categories on TV.com. A user can then view more details on a particular show including premiere date, episode information, and cast information."
  spec.homepage      = "https://github.com/michaelsimon/tvcom_toptwenty_cli_gem"
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

  spec.add_development_dependency "bundler", "~> 1.11.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
