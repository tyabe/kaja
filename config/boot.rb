RACK_ENV  = ENV['RACK_ENV'] ||= 'development'  unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
require 'csv'
Bundler.require(:default, RACK_ENV)

Padrino::Logger::Config[:production][:colorize_logging] = false

Padrino.before_load do
  I18n.enforce_available_locales = true
  I18n.default_locale = :ja
end

Padrino.after_load do
end

Padrino.load!
