require 'spec_helper'

describe Yr::Place do
  subject { Yr::Place.find "Oslo" }

  describe ".find" do
    it "returns a place" do
      expect(Yr::Place.find("Oslo").place).to eq("Oslo")
    end
  end

  describe "#now" do
    it "returns the current weather"
  end

  describe "#forecast_url" do
    it "generates a correct url" do
      expect(subject.forecast_url).to eq("http://www.yr.no/place/Norway/Oslo/Oslo/Oslo/forecast.xml")
    end
  end
end
