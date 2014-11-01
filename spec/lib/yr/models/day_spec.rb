require 'spec_helper'

describe Yr::Day do
  let(:period0) { build :period, id: 0  }
  let(:period1) { build :period, id: 1  }
  let(:period2) { build :period, id: 2  }
  let(:period3) { build :period, id: 3  }
  let(:period4) { build :period, id: 4  }
  let(:periods) { [period0, period1, period2, period3, period4] }
  subject { build :day, periods: periods }

  describe "#day_period" do
    context "period 2 is there" do
      it "returns period 2" do
        expect(subject.day_period).to eq(period2)
      end
    end

    context "period 2 has passed" do
      let(:day) { build :day, periods: periods[3,5] }

      it "returns period 3" do
        expect(day.day_period).to eq(period3)
      end
    end
  end

  describe "#temperature" do
    it "returns the temperature for day period" do
      expect(subject.temperature).to eq(period2.temperature)
    end
  end

  describe "#symbol" do
    it "returns the symbol for day period" do
      expect(subject.symbol).to eq(period2.symbol)
    end
  end

  describe "#pressure" do
    it "returns the pressure for day period" do
      expect(subject.pressure).to eq(period2.pressure)
    end
  end

  describe "#precipitation" do
    it "returns the precipitation for day period" do
      expect(subject.precipitation).to eq(period2.precipitation)
    end
  end
end
