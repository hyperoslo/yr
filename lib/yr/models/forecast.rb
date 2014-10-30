module Yr
  class Forecast
    attr_accessor :location, :days, :credit_text, :credit_url

    def initialize xml
      @xml = xml
    end

    def location
      @location ||= parse_location
    end

    def days
      @days ||= parse_forecast
    end

    def credit_text
      @credit_text ||= parse_credit["text"]
    end

    def credit_url
      @credit_url ||= parse_credit["url"]
    end

    def parse_location
      location = @xml.xpath("//weatherdata/location").first
      name = location.xpath("//name").first.text
      country = location.xpath("//country").first.text
      Location.new(name, country)
    end

    def parse_credit
      location = @xml.xpath("//weatherdata/credit").first
      link = location.xpath("//link").first
      link
    end

    def parse_forecast
      days = []

      times = @xml.xpath("//forecast/text/location/time")
      times.each do |time|
        name        = time.xpath("//title").first.text
        description = time.xpath("//body").first.text
        days << Day.new(name, description)
      end

      days
    end
  end
end
