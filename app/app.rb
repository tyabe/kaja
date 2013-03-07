# coding: utf-8
class Kaja < Padrino::Application
  register ScssInitializer
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Cache

  configure :production do
    set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new(ENV["MEMCACHIER_SERVERS"],
                                                                        { username: ENV["MEMCACHIER_USERNAME"],
                                                                          password: ENV["MEMCACHIER_PASSWORD"]}
                                                                       ))
  end
  configure :development do
    set :cache, Padrino::Cache::Store::Memory.new(5000)
  end

  enable :caching

  before do
    I18n.locale = (params[:captures] && s=params[:captures].first) ? s.gsub("/","").to_sym : :ja
    expires_in 60
  end

end
