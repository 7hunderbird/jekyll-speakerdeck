module Jekyll::Speakerdeck
  class Tag < ::Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @parser = TagParser.new(markup)
    end

    def render(context)
      %|<script async="true" class="speakerdeck-embed" data-id="#{speakerdeck_id}" src="//speakerdeck.com/assets/embed.js"#{options}></script>|
    end

    private
    def speakerdeck_id
      @parser.speakerdeck_id
    end

    def options
      %| #{@parser.options}| unless @parser.options == ""
    end
  end
end


Liquid::Template.register_tag('speakerdeck', Jekyll::Speakerdeck::Tag)
