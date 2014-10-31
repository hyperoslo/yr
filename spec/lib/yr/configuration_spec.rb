require "spec_helper"

module Yr
  describe Configuration do
    describe "#language" do
      it "default value is en" do
        Configuration.new.language = "en"
      end
    end

    describe "#language=" do
      it "can set value" do
        config = Configuration.new
        config.language = "no"
        expect(config.language).to eq("no")
      end
    end
  end
end
