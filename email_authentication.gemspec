$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "email_authentication/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "email_authentication"
  s.version     = EmailAuthentication::VERSION
  s.authors     = ["Rene Kersten"]
  s.email       = ["rene.kersten@gmail.com"]
  s.homepage    = "https://github.com/endorfin/email_authentication.git"
  s.summary     = "Passwordless authentication"
  s.description = "Passwordless authentication with tokens sent to an email address"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
end
