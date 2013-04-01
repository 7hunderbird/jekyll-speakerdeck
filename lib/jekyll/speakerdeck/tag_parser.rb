module Jekyll::Speakerdeck
  class TagParser
    attr_accessor :speakerdeck_id, :options

    def initialize(markup)
      params = markup.shellsplit
      @speakerdeck_id = params.shift
      @options = option_parser(params)
    end

    private
    def option_parser(params) #fix me
      result = params.map { |var|
        key, val = var.split(/=/).map(&:strip)
        %|#{key}="#{val}"| if valid?(key)
      }.compact.join(" ")

      result
    end

    def valid?(key)
      avairable_options.include?(key)
    end

    def avairable_options
      ['data-slide']
    end
  end
end
