Kaja::App.helpers do

  def menu_list
    content_tag :ul do
      t('menu').inject(ActiveSupport::SafeBuffer.new) do | list, (menu, text) |
        list << content_tag(:li, class: "#{menu} link") do
          link_to text.to_s, i18n_path("/#{menu}")
        end
      end
    end
  end

  def auto_link(value)
    value.to_s.gsub!(%r{([^"]|^)(https?)(://[\w!:;/.?%#&=+-~]+)}, '\1<a href="\2\3" target="_blank">\2\3</a>' )
    value.to_s.gsub(%r{([^"]|^)(https?)(:&#x2F;&#x2F;[\w!:;/.?%#&=+-~]+)}, '\1<a href="\2\3" target="_blank">\2\3</a>' ).html_safe
  end

  def i18n_path(s)
    root = I18n.locale == :ja ? "/" : "/#{I18n.locale}"
    s == "/" ? root : File.join(root, s)
  end

  def rubyize(s,t)
    "<ruby>#{s}<rp>（</rp><rt>#{t}</rt><rp>）</rp></ruby>"
  end

  def page_id
    request.action.to_s.camelcase
  end

end
