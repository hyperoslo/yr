module Yr
  class Symbol
    attr_accessor :id, :number, :name

    def svg
      "yr/symbols/svg/#{id}.svg"
    end

    def png(size: 48)
      "yr/symbols/b#{size}/#{id}.png"
    end
  end
end
