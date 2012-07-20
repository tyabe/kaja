Kaja.helpers do

  def menu_list
    text = "<ul>" +
    t('menu').inject('') {| string, (menu, text) |
      string << %(<li class="#{menu} link">#{link_to(text, i18n_path("/#{menu}"))}</li>)
    } + "</ul>"
    concat_content text
  end

end
