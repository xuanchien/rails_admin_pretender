Gem::Specification.new do |s|
  s.name        = 'rails_admin_pretender'
  s.version     = '0.0.1'
  s.date        = '2019-04-16'
  s.summary     = "Rails Admin Pretender"
  s.description = "A simple gem to integrate pretender with RailsAdmin"
  s.authors     = ["Chien Tran"]
  s.email       = 'chientranx@gmail.com'
  s.files       = ["lib/rails_admin_pretender.rb"]
  s.homepage    =
    'http://rubygems.org/gems/rails_admin_pretender'
  s.license       = 'MIT'

  s.add_dependency "pretender", "~> 0.3.4"
end