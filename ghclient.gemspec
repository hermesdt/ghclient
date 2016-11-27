# -*- encoding: utf-8 -*-

Gem::Specification.new do |spec|
  spec.authors        = ['Alvaro Duran']
  spec.description    = 'github client'
  spec.email          = ['hermesdt@gmail.com']
  spec.files          += Dir.glob('{lib,spec}/**/*')
  spec.homepage       = 'http://github.com/hermesdt/ghclient'
  spec.licenses       = ['MIT']
  spec.name           = 'ghclient'
  spec.require_paths  = ['lib']
  spec.summary        = 'github client'
  spec.test_files     = Dir.glob('spec/**/*')
  spec.version        = '0.0.1'

  spec.add_dev_dependency 'rspec', ['>= 3.5.0']
end