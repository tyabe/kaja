source 'https://rubygems.org'

ruby '2.1.1'

# Server requirements
gem 'puma'

# Project requirements
gem 'rake'

# Component requirements
gem 'sass'
gem 'erubis'

group :production do
  gem 'dalli'
end

group :development do
  gem 'pry-padrino'
end

# Test requirements
group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end

gem 'padrino', '0.12.0'
