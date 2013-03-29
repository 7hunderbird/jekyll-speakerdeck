module Jekyll::Speakerdeck
  class TagParser
    attr_accessor :speakerdeck_id, :data_slide
    def initialize(markup)
      options = markup.split(/,/)
      @speakerdeck_id = options[0].strip
      @data_slide = options[1].strip if options[1]
    end
  end
end
