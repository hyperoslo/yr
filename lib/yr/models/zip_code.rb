require 'open-uri'

module Yr
  class ZipCode
    attr_accessor :zip_code

    def initialize(zip_code=nil)
      @zip_code = zip_code
    end

    def forecast
      @forecast ||= fetch_forecast
    end

    def forecast_url
      "#{Yr.api_endpoint}postnummer/#{URI.encode(@zip_code)}/forecast.xml"
    end

    def fetch_forecast
      Forecast.new Nokogiri::XML(open(forecast_url))
    end
  end
end
