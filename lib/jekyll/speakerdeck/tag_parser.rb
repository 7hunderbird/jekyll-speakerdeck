module Jekyll::Speakerdeck
  class TagParser
    attr_accessor :speakerdeck_id, :options

    def initialize(markup)
      @params = markup.shellsplit
      @speakerdeck_id = @params.shift
    end

    def options #fix me
      @options ||= @params.map do |var|
        key, val = var.split(/=/)
        %|#{key}="#{val}"| if valid?(key)
      end.compact.join(" ")
    end

    def valid?(key)
      avairable_options.include?(key)
    end

    def avairable_options
      ['data-slide']
    end
  end
end
