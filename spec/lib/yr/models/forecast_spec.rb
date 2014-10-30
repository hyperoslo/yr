require 'spec_helper'

describe Yr::Forecast do
  let(:xml) { Nokogiri::XML(fixture("/forecast.xml")) }

  subject { Yr::Forecast.new(xml) }

  describe "#parse_location" do
    it "parses the forecast document" do
      location = subject.parse_location
      expect(location.name).to eq("Oslo")
      expect(location.country).to eq("Norway")
    end
  end

  describe "#parse_forecast" do
    it "parses the forecast document" do
      days = subject.parse_forecast
      day = days.first

      expect(day.name).to eq("Thursday")
      expect(day.description).to eq("<strong>Østlandet og Telemark:</strong> Skiftende bris. Pent vær, tilskyende fra sør utover ettermiddagen, men fortsatt opphold.")
      expect(day.temperature.unit).to eq("celsius")
      expect(day.temperature.value).to eq(7)
      expect(day.symbol.id).to eq("03d")
      expect(day.precipitation).to eq(0)
      expect(day.pressure.unit).to eq("hPa")
      expect(day.pressure.value).to eq(1022)
    end
  end

  describe "#parse_credit" do
    it "parses the forecast document" do
      link = subject.parse_credit
      expect(link["text"]).to eq("Weather forecast from yr.no, delivered by the Norwegian Meteorological Institute and the NRK")
      expect(link["url"]).to eq("http://www.yr.no/place/Norway/Oslo/Oslo/Oslo/")
    end
  end

  describe "#days" do
    it "returns a list of days" do
      expect(subject.days.size).to eq(5)
    end
  end
end
