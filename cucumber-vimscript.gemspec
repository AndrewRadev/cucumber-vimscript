# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'cucumber-vimscript'
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew Radev"]
  s.email       = ['andrey.radev@gmail.com']
  s.homepage    = 'http://github.com/AndrewRadev/cucumber-vimscript'
  s.summary     = 'A vimscript driver for cucumber'
  s.description = 'Provides step definitions to spawn and command a vim instance'

  s.add_dependency 'cucumber', '>= 1.0.2'
  s.add_dependency 'vimrunner'

  s.rubygems_version = ">= 1.6.1"
  s.files            = Dir['lib/**/*.rb']
  s.rdoc_options     = ['--charset=UTF-8']
  s.require_path     = 'lib'
end
