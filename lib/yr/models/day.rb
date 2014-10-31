module Yr
  class Day
    attr_accessor :name, :description, :date, :periods

    def initialize(name=nil, description=nil, date=nil, periods=nil)
      @name        = name
      @description = description
      @date        = date
      @periods     = periods
    end

    # According to the yr.no API specs, period with id 2 represents
    # the most accurate forecast for the whole day. So if you are
    # only going to use show one period, use that. But if that time
    # period has passed it will not exist, so use the first available.
    #
    # The reason is that yr.no don't show historical data in the api.
    def day_period
      if period = @periods.find{|p| p.id == 2}
        period
      else
        @periods.first
      end
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
