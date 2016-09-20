$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "compliance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "compliance"
  s.version     = Compliance::VERSION
  s.authors     = ["sandeepchinapu"]
  s.email       = ["sandeep_chinapu@intuit.com"]
  s.summary     = "Summary of Compliance page."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.7.1"
  s.add_dependency "quickbase"
  
  s.add_development_dependency "sqlite3"
end
