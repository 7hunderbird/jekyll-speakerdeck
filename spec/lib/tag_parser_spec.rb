require File.expand_path('../../spec_helper', __FILE__)

describe Jekyll::Speakerdeck::TagParser do
  let(:speakerdeck_id) { Forgery(:basic).encrypt }
  let(:data_slide) { Forgery(:basic).number.to_s }
  subject { Jekyll::Speakerdeck::TagParser.new(markup) }

  describe "A speakerdeck_id and data_slide." do
    let(:markup) { "#{speakerdeck_id},#{data_slide}" }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'data_slide must equal data_slide' do
      subject.data_slide.must_equal data_slide
    end
  end

  describe "A speakerdeck_id" do
    let(:markup) { "#{speakerdeck_id}" }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'parser.data_slide must be nil' do
      subject.data_slide.must_be_nil
    end
  end

  describe "Space at the end" do
    let(:markup) { "#{speakerdeck_id} " }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'data_slide must be nil' do
      subject.data_slide.must_be_nil
    end
  end

  describe "Space at the beginning" do
    let(:markup) { " #{speakerdeck_id}" }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'data_slide must be nil' do
      subject.data_slide.must_be_nil
    end
  end

  describe "Space at the beginning and end" do
    let(:markup) { " #{speakerdeck_id}  " }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'data_slide must be nil' do
      subject.data_slide.must_be_nil
    end
  end

  describe "Space between the elements" do
    let(:markup) { " #{speakerdeck_id},    #{data_slide}  " }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'data_slide must equal data_slide' do
      subject.data_slide.must_equal data_slide
    end
  end

  describe "Blank markup" do
    let(:markup) { "" }

    it "Initialize must raise NoMethodError" do
      proc { subject }.must_raise NoMethodError
    end
  end
end
