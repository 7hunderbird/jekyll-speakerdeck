require File.expand_path('../../spec_helper', __FILE__)

describe Jekyll::Speakerdeck::TagParser do
  let(:speakerdeck_id) { Forgery(:basic).encrypt }
  let(:options) { %|data-slide="#{Forgery(:basic).number.to_s}"| }

  subject { Jekyll::Speakerdeck::TagParser.new(markup) }

  describe "A speakerdeck_id and data-slide." do
    let(:markup) { "#{speakerdeck_id}  #{options}" }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'options must equal options' do
      subject.options.must_equal options
    end
  end

  describe "A speakerdeck_id and invalid options." do
    let(:markup) { %|#{speakerdeck_id}  #{options} with-invalid="options"| }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'options must equal options' do
      subject.options.must_equal options
    end
  end

  describe "A speakerdeck_id" do
    let(:markup) { "#{speakerdeck_id}" }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'parser.options must be nil' do
      subject.options.must_be_empty
    end
  end

  describe "Space at the end" do
    let(:markup) { "#{speakerdeck_id} " }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'options must be nil' do
      subject.options.must_be_empty
    end
  end

  describe "Space at the beginning" do
    let(:markup) { " #{speakerdeck_id}" }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'options must be nil' do
      subject.options.must_be_empty
    end
  end

  describe "Space at the beginning and end" do
    let(:markup) { " #{speakerdeck_id}  " }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'options must be nil' do
      subject.options.must_be_empty
    end
  end

  describe "Space between the elements" do
    let(:markup) { " #{speakerdeck_id}    #{options}  " }

    it 'speakerdeck_id must equal speakerdeck_id' do
      subject.speakerdeck_id.must_equal speakerdeck_id
    end

    it 'options must equal options' do
      subject.options.must_equal options
    end
  end
end
