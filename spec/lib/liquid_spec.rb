require File.expand_path('../../spec_helper', __FILE__)

describe Liquid do
  subject { Liquid::Template.parse(template).render }
  let(:speakerdeck_id) { Forgery(:basic).encrypt }

  describe "There is a speakerdeck_id and data_slide." do
    let(:data_slide) { Forgery(:basic).number }
    let(:template) { %|{% speakerdeck #{speakerdeck_id} data-slide=#{data_slide}%}| }
    let(:js) { %|<script async="true" class="speakerdeck-embed" data-id="#{speakerdeck_id}" src="//speakerdeck.com/assets/embed.js" data-slide="#{data_slide}"></script>| }

    it 'must equal js tag' do
      subject.must_equal js
    end
  end

  describe "There is a speakerdeck_id" do
    let(:template) { %|{% speakerdeck #{speakerdeck_id} %}| }
    let(:js) { %|<script async="true" class="speakerdeck-embed" data-id="#{speakerdeck_id}" src="//speakerdeck.com/assets/embed.js"></script>| }
    
    it 'must equal js tag' do
      subject.must_equal js
    end
  end
end
