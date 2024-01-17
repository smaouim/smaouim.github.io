require "jekyll"

module Jekyll
  class JDoodle < Liquid::Block

    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
        content = super.strip
        return "<div data-pym-src=\"https://www.jdoodle.com/plugin\" data-language=\"python3\"  data-version-index=\"3.11.5\" data-libs=\"\">#{content}</div>"
    end
  end
end

Liquid::Template.register_tag('JDoodle', Jekyll::JDoodle)