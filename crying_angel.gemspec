# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crying_angel/version'

Gem::Specification.new do |spec|
  spec.name          = 'crying_angel'
  spec.version       = CryingAngel::VERSION
  spec.authors       = ['Vitalii Elenhaupt']
  spec.email         = ['velenhaupt@gmail.com']
  spec.summary       = 'Crying angel problem'
  spec.description   = 'Test task'
  spec.homepage      = 'https://github.com/veelenga/crying_angel'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^spec\//)
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
end
