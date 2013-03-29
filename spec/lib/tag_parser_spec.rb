require File.expand_path('../../spec_helper', __FILE__)

describe Jekyll::Speakerdeck::TagParser do
  let(:parser) { Jekyll::Speakerdeck::TagParser.new(markup) }
  let(:speakerdeck_id) { Forgery(:basic).encrypt }
  let(:data_slide) { Forgery(:basic).number.to_s }

  describe "A speakerdeck_id and data_slide." do
    let(:markup) { "#{speakerdeck_id} #{data_slide}" }

    it 'parser.speakerdeck_id must equal speakerdeck_id' do
      parser.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'parser.data_slide must equal data_slide' do
      parser.data_slide.must_equal data_slide
    end
  end

  describe "A speakerdeck_id" do
    let(:markup) { "#{speakerdeck_id}" }

    it 'parser.speakerdeck_id must equal speakerdeck_id' do
      parser.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'parser.data_slide must be nil' do
      parser.data_slide.must_be_nil
    end
  end

  describe "Space at the end" do
    let(:markup) { "#{speakerdeck_id} " }

    it 'parser.speakerdeck_id must equal speakerdeck_id' do
      parser.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'parser.data_slide must be nil' do
      parser.data_slide.must_be_nil
    end
  end

  describe "Space at the beginning" do
    let(:markup) { " #{speakerdeck_id}" }

    it 'parser.speakerdeck_id must equal speakerdeck_id' do
      parser.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'parser.data_slide must be nil' do
      parser.data_slide.must_be_nil
    end
  end

  describe "Space at the beginning and end" do
    let(:markup) { " #{speakerdeck_id}  " }

    it 'parser.speakerdeck_id must equal speakerdeck_id' do
      parser.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'parser.data_slide must be nil' do
      parser.data_slide.must_be_nil
    end
  end

  describe "Space between the elements" do
    let(:markup) { " #{speakerdeck_id}    #{data_slide}  " }

    it 'parser.speakerdeck_id must equal speakerdeck_id' do
      parser.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'parser.data_slide must equal data_slide' do
      parser.data_slide.must_equal data_slide
    end
  end
end
