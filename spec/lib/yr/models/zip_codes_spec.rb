require 'spec_helper'

describe Yr::ZipCode do
  subject { build :zip_code }

  describe "#forecast_url" do
    it "generates a correct url" do
      expect(subject.forecast_url).to eq("http://www.yr.no/place/Norway/postnummer/0461/forecast.xml")
    end
  end
end
