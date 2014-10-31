require 'spec_helper'

describe Yr do
  describe "#configure" do

    context "english" do
      before do
        Yr.configure do |config|
          config.language = "en"
        end
      end

      it "uses the english API endpoint" do
        expect(Yr.api_endpoint).to eq("http://www.yr.no/place/Norway/")
      end
    end

    context "norwegian" do
      before do
        Yr.configure do |config|
          config.language = :no
        end
      end

      after do
        Yr.reset
      end

      it "uses the norwegian API endpoint" do
        expect(Yr.api_endpoint).to eq("http://www.yr.no/sted/Norge/")
      end
    end
  end
end
