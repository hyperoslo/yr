require 'spec_helper'

describe Yr::Place do
  subject { build :place }

  describe ".find" do
    it "returns a place" do
      expect(Yr::Place.find("Oslo").place).to eq("Oslo")
    end

    context 'has non latin characters' do
      it 'uri encodes it correctly' do
        expect(Yr::Place.find("Halden").county).to eq("Østfold")
      end
    end
  end

  describe "#now" do
    it "returns the current weather"
  end

  describe "#forecast_url" do
    it "generates a correct url" do
      expect(subject.forecast_url).to eq("http://www.yr.no/place/Norway/Oslo/Oslo/Oslo/forecast.xml")
    end
    context "url has non latin characters in it" do
      it "generates a correct url" do
        place = build :place, county: "Østfold", municipality: "Halden", place: "Halden"
        expect(place.forecast_url).to eq("http://www.yr.no/place/Norway/%C3%98stfold/Halden/Halden/forecast.xml")
      end
    end
  end
end
