module Kaja
  class App
    module ApplicationHelper

      def menu_list
        content_tag :ul do
          t('menu').inject(ActiveSupport::SafeBuffer.new) do | list, (menu, text) |
            list << content_tag(:li, class: "#{menu} link") do
            link_to text.to_s, i18n_path("/#{menu}")
            end
          end
        end
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

    helpers ApplicationHelper
  end
end
