Kaja.helpers do

  def menu_list
    text = "<ul>" +
    t('menu').inject('') {| string, (menu, text) |
      string << %(<li class="#{menu} link">#{link_to(text, i18n_path("/#{menu}"))}</li>)
    } + "</ul>"
    concat_content text
  end

  def auto_link(value)
    value.to_s.gsub(%r{([^"]|^)(https?)(://[\w:;/.?%#&=+-]+)}, '\1<a href="\2\3" target="_blank">\2\3</a>' )
  end

end
