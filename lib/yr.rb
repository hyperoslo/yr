require 'yr/version'

require 'nokogiri'

require "yr/engine"
require 'yr/configuration'
require 'yr/models/place'
require 'yr/models/zip_code'
require 'yr/models/forecast'
require 'yr/models/location'
require 'yr/models/day'
require 'yr/models/period'
require 'yr/models/temperature'
require 'yr/models/pressure'
require 'yr/models/symbol'

module Yr
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.api_endpoint
    if configuration.language and configuration.language.to_sym == :no
      "http://www.yr.no/sted/Norge/"
    else
      "http://www.yr.no/place/Norway/"
    end
  end

  def self.root
    File.dirname __dir__
  end
end
