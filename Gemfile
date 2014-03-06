source 'https://rubygems.org'

ruby '2.1.1'

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'
gem 'active_attr'

# Component requirements
gem 'sass'

# Padrino Stable Gem
#gem 'padrino', '0.10.7'

group :production do
  gem 'dalli'
end

group :development do
  gem 'pry-padrino'
end

# Test requirements
group :test do
  gem 'rspec'
  gem 'rack-test'
end

gem 'padrino', '0.12.0'
