require "jekyll"

module Jekyll
  class Solution < Liquid::Block

    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
        return "<details><summary><i class=\"fa fa-lightbulb-o\" aria-hidden=\"true\"></i> Solution</summary>#{super}</details>"
    end
  end
end

Liquid::Template.register_tag('Solution', Jekyll::Solution)