module Jekyll::Speakerdeck
  class TagParser
    attr_accessor :speakerdeck_id, :data_slide
    def initialize(markup)
      case markup.strip
      when /\A([0-9A-Za-z]+)(?:|\s{1,}(\d{1,}))\z/i
        @speakerdeck_id = $1
        @data_slide = $2
      end
    end
  end
end
