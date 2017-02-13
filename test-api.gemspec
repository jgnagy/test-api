# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'test-api'
  spec.version       = '0.0.1'
  spec.authors       = ['Jonathan Gnagy']
  spec.email         = ['REDACTED']

  spec.summary       = 'Test API Server'
  spec.homepage      = 'https://github.com/jgngay/test-api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.0'

  spec.add_runtime_dependency 'sinatra', '>= 2.0.0.beta2', '< 3'
  spec.add_runtime_dependency 'sinatra-contrib', '>= 2.0.0.beta2', '< 3'
  spec.add_runtime_dependency 'json', '~> 2.0'
  spec.add_runtime_dependency 'jsonapi-serializers', '~> 0.16'
  spec.add_runtime_dependency 'sinja', '~> 1.2'
end
