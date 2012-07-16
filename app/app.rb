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

  get %r{/(en/)?about} do
    @page_id = 'About'
    render :about
  end

  get %r{/(en/)?entry} do
    @community = Community.new
    @page_id = 'Entry'
    render :entry
  end

  post %r{/(en/)?entry} do
    @community = Community.new(params[:community])
    @page_id = 'Entry'
    if @community.save
      flash[:complete] = true
      redirect i18n_path('/entry')
    else
      render :entry
    end
  end

  private

  def i18n_path(s)
    root = I18n.locale == :ja ? "/" : "/#{I18n.locale}"
    s == "/" ? root : File.join(root, s)
  end

  def rubyize(s,t)
    "<ruby>#{s}<rp>（</rp><rt>#{t}</rt><rp>）</rp></ruby>"
  end

end
