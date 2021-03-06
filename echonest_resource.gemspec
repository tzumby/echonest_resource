# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "echonest_resource/version"

Gem::Specification.new do |s|
  s.name        = "echonest_resource"
  s.version     = EchonestResource::VERSION
  s.authors     = ["tzumby"]
  s.email       = ["tzumby@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Echonest API Wrapper}
  s.description = %q{Use this gem to search the Echonest API for Artists and Songs}

  s.rubyforge_project = "echonest_resource"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "hashie"
end
