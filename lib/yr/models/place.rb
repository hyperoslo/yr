require 'open-uri'
require 'yaml'

module Yr
  class Place
    attr_accessor :county, :municipality, :place, :forecast

    def initialize(opts=nil)
      if opts
        opts.each{|k,v| self.send("#{k}=", v)}
      end
    end

    def forecast
      @forecast ||= fetch_forecast
    end

    def forecast_url
      "#{Yr.api_endpoint}#{URI.encode(county.capitalize)}/#{URI.encode(municipality.capitalize)}/#{URI.encode(place.capitalize)}/forecast.xml"
    end

    def fetch_forecast
      Forecast.new Nokogiri::XML(open(forecast_url))
    end

    def to_s
      place
    end

    class << self
      def all_places
        YAML::load_file(File.join(Yr.root, "/config/places.yml"))
      end

      def find(place_name)
        all_places.find{|p| p.place == place_name}
      end
    end
  end
end
