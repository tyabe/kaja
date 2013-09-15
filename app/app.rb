class Kaja < Padrino::Application
  register ScssInitializer
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Cache

  case Padrino.env
  when :develpment
    set :cache, Padrino::Cache::Store::Memory.new(5000)
  when :production
    set :cache, Padrino::Cache::Store::Memcache.new(
      ::Dalli::Client.new(
        ENV["MEMCACHIER_SERVERS"],
        { username: ENV["MEMCACHIER_USERNAME"],
          password: ENV["MEMCACHIER_PASSWORD"]}
    ))
  end

  enable :caching

  before do
    captures = params[:captures].to_a.dup
    I18n.locale = (@lcid=captures.pop) ? @lcid.gsub("/","").to_sym : :ja
    @year = captures.pop
    expires_in 60
  end

  def current_year
    @year ||= "2013"
  end

end
