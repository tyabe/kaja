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
    t = :p
    start_tag = tag(t, {}, true)
    text = value.to_s
    text.gsub!(%r{([^"]|^)(https?)(://[\w!:;/.?%#&=+-~]+)}, '\1<a href="\2\3" target="_blank">\2\3</a>')
    text.gsub!(/\r\n?/, "\n")
    text.gsub!(/\n\n+/, "</#{t}>\n\n#{start_tag}")
    text.gsub!(/([^\n]\n)(?=[^\n])/, '\1<br />')
    text.insert 0, start_tag
    text << "</#{t}>"
    text.html_safe
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
