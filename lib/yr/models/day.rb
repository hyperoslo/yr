module Yr
  class Day
    attr_accessor :name, :description, :date, :periods

    def initialize(name, description, date, periods)
      @name        = name
      @description = description
      @date        = date
      @periods     = periods
    end

    def day_period
      @periods.find{|p| p.id == 2}
    end

    def temperature
      day_period.temperature
    end

    def symbol
      day_period.symbol
    end

    def pressure
      day_period.pressure
    end

    def precipitation
      day_period.precipitation
    end
  end
end
