# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/speakerdeck/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-speakerdeck"
  spec.version       = Jekyll::Speakerdeck::VERSION
  spec.authors       = ["TAKAHASHI Kazunari"]
  spec.email         = ["takahashi@1syo.net"]
  spec.description   = %q{Jekyll::Speakerdeck is jekyll plugin for Speakerdeck.}
  spec.summary       = %q{Jekyll::Speakerdeck is jekyll plugin for Speakerdeck.}
  spec.homepage      = "https://github.com/1syo/jekyll-speakerdeck"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "liquid", "~> 2.3.0"
  spec.add_dependency "jekyll", "~> 0.12.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "forgery"
end
