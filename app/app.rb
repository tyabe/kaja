module Kaja
  class App < Padrino::Application
    register ScssInitializer
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    disable :sessions
    disable :protect_from_csrf

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
      Rinku.auto_link(text, :all, 'target="_blank"').html_safe
    end

    error Padrino::Rendering::TemplateNotFound do not_found; end

  end
end
