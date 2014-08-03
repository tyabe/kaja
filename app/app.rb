module Kaja
  class App < Padrino::Application
    register ScssInitializer
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Cache

    disable :sessions
    disable :protect_from_csrf
    enable  :caching

    case Padrino.env
    when :develpment
      set :cache, Padrino::Cache.new(:LRUHash)
    when :production
      set :cache, Padrino::Cache.new(
        :Memcached,
        backend: ::Dalli::Client.new( ENV["MEMCACHIER_SERVERS"], { username: ENV["MEMCACHIER_USERNAME"], password: ENV["MEMCACHIER_PASSWORD"] })
      )
    end

    before do
      captures = params[:captures].to_a.dup
      I18n.locale = (@lcid = captures.shift) ? @lcid.to_s.gsub('/', '').to_sym : :ja
      @year = captures.pop
      expires 60
    end

    def current_year
      @year ||= '2014'
    end

    def auto_link(text)
      Rinku.auto_link(text).html_safe
    end

    error Padrino::Rendering::TemplateNotFound do not_found; end

  end
end
