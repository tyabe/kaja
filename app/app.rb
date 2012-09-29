# coding: utf-8
class Kaja < Padrino::Application
  register ScssInitializer
  use ActiveRecord::ConnectionAdapters::ConnectionManagement
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers


  before do
    I18n.locale = (params[:captures] && s=params[:captures].first) ? s.gsub("/","").to_sym : :ja
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
    @page_id = 'Entry'
    render :entry
  end

  get %r{/(en/)?faq} do
    @page_id = 'Faq'
    render :faq
  end

  get %r{/(en/)?kaja} do
    @page_id = 'Kaja'
    @nominees = Nominee.of(2012)
    render :kaja
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
