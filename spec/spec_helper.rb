require 'bundler/setup'
Bundler.require

require 'minitest/spec'
require 'minitest/autorun'
require 'forgery'

$LOAD_PATH << File.expand_path('../../lib/jekyll', __FILE__)
