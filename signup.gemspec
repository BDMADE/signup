$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'signup/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'signup'
  s.version     = Signup::VERSION
  s.authors     = ['Hasan Mohammad Tanbir']
  s.email       = ['tanbir2025@gmail.com']
  s.homepage    = 'https://github.com/bdmade/signup'
  s.summary     = 'It is authentication gem.'
  s.description = 'This gem make authentication very simple'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.required_ruby_version = '>= 2.2.2'
  s.add_dependency 'rails', '~> 5.0.0', '>= 5.0.0.1'
  s.add_dependency 'bcrypt', '~> 3.1', '>= 3.1.11'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'bcrypt'
end
