
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'identity_parade/version'

Gem::Specification.new do |spec|
  spec.name          = 'identity_parade'
  spec.version       = IdentityParade::VERSION
  spec.authors       = ['Henning Vogt']
  spec.email         = ['git@henvo.de']

  spec.summary       = 'Find duplicates or near-duplicates of.'
  spec.description   = 'This gem allows to compare two hashes.'
  spec.homepage      = 'https://github.com/henvo/identity_parade'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'fuzzy-string-match', '~> 1.0', '>= 1.0.1'
  spec.add_dependency 'recursive-open-struct', '~> 1.1'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'reek', '~> 4.8'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
