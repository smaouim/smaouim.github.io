require "jekyll"

module Jekyll
  class EmptyJDoodle < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
        return "<div data-pym-src=\"https://www.jdoodle.com/plugin\" data-language=\"python3\"  data-version-index=\"3.11.5\" data-libs=\"\"></div>"
    end
  end
end

Liquid::Template.register_tag('empty_jdoodle', Jekyll::EmptyJDoodle)