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
      name = location.xpath("name").first.text
      country = location.xpath("country").first.text
      Location.new(name, country)
    end

    def parse_credit
      location = @xml.xpath("//weatherdata/credit").first
      link = location.xpath("link").first
      link
    end

    def parse_forecast
      days = []

      times = @xml.xpath("//forecast/text/location/time")
      times.each do |time|
        # Fetched from the text time nodes.
        name          = time.xpath("title").first.text
        description   = time.xpath("body").first.text
        date          = Date.parse time["from"]

        # Fetch more detailed data for each period of the day
        periods = []
        # Use the xpath start-with syntax to find periods that starts with the same date
        tabular_data = @xml.xpath("//forecast/tabular/time[starts-with(@from, \"#{date}\")]")
        unless tabular_data.empty?
          tabular_data.each do |xml|
            symbol        = Symbol.new
            symbol.id     = xml.xpath("symbol").first["var"]
            symbol.number = xml.xpath("symbol").first["numberEx"]
            symbol.name   = xml.xpath("symbol").first["name"]

            precipitation = xml.xpath("precipitation").first["value"].to_i

            temperature = Temperature.new
            temperature.unit = xml.xpath("temperature").first["unit"]
            temperature.value = xml.xpath("temperature").first["value"].to_i

            pressure = Pressure.new
            pressure.unit = xml.xpath("pressure").first["unit"]
            pressure.value = xml.xpath("pressure").first["value"].to_i

            period = Period.new
            period.id = xml["period"].to_i
            period.symbol = symbol
            period.precipitation = precipitation
            period.temperature = temperature
            period.pressure = pressure
            period.from = DateTime.parse xml["from"]
            period.to = DateTime.parse xml["to"]

            periods << period
          end

          days << Day.new(name, description, date, periods)
        end
      end

      days
    end
  end
end
