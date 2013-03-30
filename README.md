[![Build Status](https://travis-ci.org/1syo/jekyll-speakerdeck.png?branch=master)](https://travis-ci.org/1syo/jekyll-speakerdeck)

# Jekyll::Speakerdeck

Jekyll::Speakerdeck is jekyll plugin for Speakerdeck.

## Installation

Add this line to your application's Gemfile:

    gem 'jekyll-speakerdeck', git: 'git@github.com:1syo/jekyll-speakerdeck.git', tag: 'v0.0.1', require: false

And then execute:

    $ bundle

Add the following to your _plugins/ext.rb file:

    require 'jekyll/speakerdeck'

## Usage

Your template file:

    {% speakerdeck b02f59b0736c013083991231381b27eb %}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
