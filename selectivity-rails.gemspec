# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'selectivity/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'selectivity-rails'
  spec.version       = Selectivity::Rails::VERSION
  spec.authors       = ['Konrad Jurkowski']
  spec.email         = ['konrad@jurkowski.me']
  spec.description   = %q{Selectivity.js is a modular and light-weight selection library for jQuery and Zepto.js. This gem integrates Selectivity.js with Ruby on Rails.}
  spec.summary       = %q{Integrate Selectivity.js with Ruby on Rails}
  spec.homepage      = 'https://github.com/msx2/selectivity-rails'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rails', '>= 3.0'
end
