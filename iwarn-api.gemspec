# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "iwarn-api"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Danilo Garcia", "Guillermo Iguaran"]
  s.email       = ["danilogarcia024@gmail.com", "guilleiguaran@gmail.com"]
  s.homepage    = "https://github.com/MastersOfFoo/iWarn-webservice"
  s.summary     = %q{iWarn API}
  s.description = %q{iWarn application API}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "nancy"
end
