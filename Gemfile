source 'https://rubygems.org'

ruby '2.0.0'

# Server requirements
gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'
gem 'active_attr'

# Component requirements
gem 'sass'
gem 'haml'

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

# Or Padrino Edge
gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end
