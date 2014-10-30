module Yr
  class Location
    attr_accessor :name, :country

    def initialize name, country
      @name = name
      @country = country
    end
  end
end
