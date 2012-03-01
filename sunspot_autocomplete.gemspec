# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunspot_autocomplete/version"

Gem::Specification.new do |s|
  s.name        = "sunspot_autocomplete"
  s.version     = SunspotAutocomplete::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["DevInterface"]
  s.email       = ["stefano.mancini@devinterface.com"]
  s.homepage    = ""
  s.summary     = %q{sunspot autocomplete capability}
  s.description = %q{sunspot autocomplete capability}

  s.rubyforge_project = "sunspot_autocomplete"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
