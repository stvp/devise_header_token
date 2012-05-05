# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "devise_header_token"
  s.version     = "1.0.0"
  s.authors     = ["Tyson Tate"]
  s.email       = ["tyson@stovepipestudios.com"]
  s.homepage    = "http://github.com/stvp/devise_header_token"
  s.summary     = "Header token authentication for Devise"
  s.description = "Patches Devise's token authentication strategy to allow proper header-based token authentication."

  s.rubyforge_project = "devise_header_token"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_development_dependency "rspec"
  # s.add_development_dependency "guard"
  # s.add_development_dependency "guard-rspec"
  # s.add_development_dependency "pry"
  # s.add_development_dependency "rake"
  # s.add_development_dependency "rack-test"
  s.add_runtime_dependency "devise"
end
