require File.expand_path('../../spec_helper', __FILE__)

describe Jekyll::Speakerdeck::Tag do
  let(:parser) { Jekyll::Speakerdeck::Parser.new(markup) }
  let(:speakerdeck_id) { Forgery(:basic).encrypt }

  subject { Jekyll::Speakerdeck::Tag.new('speakerdeck', markup, 'token') }

  describe "There is a speakerdeck_id and data_slide." do
  let(:data_slide) { Forgery(:basic).number.to_s }
    let(:markup) { "#{speakerdeck_id} #{data_slide}" }
    let(:js) { %|<script async="true" data-slide="#{data_slide}" class="speakerdeck-embed" data-id="#{speakerdeck_id}" src="//speakerdeck.com/assets/embed.js"></script>| }

    it 'must equal js tag' do
      subject.render('').must_equal js
    end
  end

  describe "There is a speakerdeck_id" do
    let(:markup) { "#{speakerdeck_id}" }
    let(:js) { %|<script async="true" data-slide="1" class="speakerdeck-embed" data-id="#{speakerdeck_id}" src="//speakerdeck.com/assets/embed.js"></script>| }

    it 'must equal js tag' do
      subject.render('').must_equal js
    end
  end
end
