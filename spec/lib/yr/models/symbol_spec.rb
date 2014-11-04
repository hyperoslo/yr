require 'spec_helper'

describe Yr::Symbol do
  subject { create :symbol }
  describe "#svg" do
    it "returns the url to the correct symbol" do
      expect(subject.svg).to eq("yr/symbols/svg/01d.svg")
    end
  end

  describe "#png" do
    it "returns the url to the correct symbol" do
      expect(subject.png).to eq("yr/symbols/b48/01d.png")
    end

    context "size is 200" do
      it "returns the url to the correct symbol" do
        expect(subject.png(size: 200)).to eq("yr/symbols/b200/01d.png")
      end
    end
  end
end
