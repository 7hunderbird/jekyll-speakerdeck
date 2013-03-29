require "liquid"
require "jekyll/speakerdeck/version"
require "jekyll/speakerdeck/tag_parser"
require "jekyll/speakerdeck/tag"

Liquid::Template.register_tag('speakerdeck', Jekyll::Speakerdeck::Tag)
