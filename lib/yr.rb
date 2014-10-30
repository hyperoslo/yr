require 'yr/version'

require 'nokogiri'

require 'yr/models/place'
require 'yr/models/forecast'
require 'yr/models/location'
require 'yr/models/day'
module Yr
  def self.root
    File.dirname __dir__
  end
end
