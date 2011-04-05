# -*- encoding: utf-8 -*-
require File.expand_path("../lib/railings/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "railings"
  s.version     = Railings::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Nathaniel Jones']
  s.email       = ['nathaniel@pointeractive.com']
  s.homepage    = "http://rubygems.org/gems/railings"
  s.summary     = "Ruby and Rails extensions"
  s.description = "Ruby and Rails extensions, mostly with Ruby 1.9.2 and Rails ~> 3.0"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "railings"
  
  s.add_dependency "rails", "~> 3.0"
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", ">= 2.5"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
