module Jekyll::Speakerdeck
  class Tag < ::Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @parser = TagParser.new(markup)
    end

    def render(context)
      %|<script async="true" data-slide="#{data_slide}" class="speakerdeck-embed" data-id="#{speakerdeck_id}" src="//speakerdeck.com/assets/embed.js"></script>|
    end

    private
    def speakerdeck_id
      @parser.speakerdeck_id
    end

    def data_slide
      @parser.data_slide || "1"
    end
  end
end
