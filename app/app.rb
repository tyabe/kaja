# coding: utf-8
class Kaja < Padrino::Application
  register ScssInitializer
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  enable :sessions

  before do
    I18n.locale = if params[:captures] && s = params[:captures].first 
      s.gsub("/","").to_sym 
    else 
      :ja
    end
  end

  get %r{/(en)?} do
    @page_id = 'Index'
    render :index
  end

  get %r{/(en)?about} do
    @page_id = 'About'
    render :about
  end

  #get %r{/(en)?communities} do
  get %r{/(en)?entry} do
    @community = Community.new
    @page_id = 'Entry'
    render :entry
  end

  get %r{/(en)?kaja} do
    @page_id = 'Kaja'
    render :kaja
  end

  #get %r{/(en)?guidelines} do
  #  @page_id = 'Guidelines'
  #  render :guidelines
  #end

  #get %r{/(en)?communities} do
  #  @community = Community.new
  #  @page_id = 'Communities'
  #  render :communities
  #end

  #get %r{/(en)?committee} do
  #  @page_id = 'Committee'
  #  render :committee
  #end

  # 名前被ったので一端コメントしています
  #post %r{/(en/)?entry} do
  #  @community = Community.new(params[:community])
  #  if @community.save
  #    flash[:complete] = true
  #    redirect i18n_path('/')
  #  else
  #    render :index
  #  end
  #end

  private

  def i18n_path(s)
    root = I18n.locale == :ja ? "/" : "/#{I18n.locale}"
    s == "/" ? root : File.join(root, s)
  end

  def rubyize(s,t)
    "<ruby>#{s}<rp>（</rp><rt>#{t}</rt><rp>）</rp></ruby>"
  end

  ##
  # Caching support
  #
  # register Padrino::Cache
  # enable :caching
  #
  # You can customize caching store engines:
  #
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Memcached.new('127.0.0.1:11211', :exception_retry_limit => 1))
  #   set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new('127.0.0.1:11211', :exception_retry_limit => 1))
  #   set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
  #   set :cache, Padrino::Cache::Store::Memory.new(50)
  #   set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
  #

  ##
  # Application configuration options
  #
  # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
  # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
  # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
  # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
  # set :public_folder, "foo/bar" # Location for static assets (default root/public)
  # set :reload, false            # Reload application files (default in development)
  # set :default_builder, "foo"   # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"       # Set path for I18n translations (default your_app/locales)
  # disable :sessions             # Disabled sessions by default (enable if needed)
  # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
  # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #

  ##
  # You can configure for a specified environment like:
  #
  #   configure :development do
  #     set :foo, :bar
  #     disable :asset_stamp # no asset timestamping for dev
  #   end
  #

  ##
  # You can manage errors like:
  #
  #   error 404 do
  #     render 'errors/404'
  #   end
  #
  #   error 505 do
  #     render 'errors/505'
  #   end
  #
end
