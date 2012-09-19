$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "routes_js/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "routes-js"
  s.version     = RoutesJs::VERSION
  s.authors     = ["Sidu Ponnappa", "Tejas Dinkar"]
  s.email       = ["ckponnappa@gmail.com", "tejas@gja.in"]
  s.homepage    = "http://c42.in/open_source"
  s.summary     = "Make Routes helpers available to your Javascript. No more hardcoded URLs!"
  s.description = "Make Routes helpers available to your Javascript. No more hardcoded URLs! No more host name issues!"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
end
