# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'motaword/config/version'
require 'motaword/config/authors'

Gem::Specification.new do |spec|
  spec.name     = 'motaword'
  spec.version  = Motaword::Config::VERSION
  spec.authors  = Motaword::Config::Authors.names
  spec.email    = Motaword::Config::Authors.emails

  spec.summary  = 'Gem for interacting with the motaword API'
  spec.homepage = 'https://github.com/bonusly/motaword-ruby'
  spec.license  = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = %w[lib]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency     'httparty',     '~> 0'
end
