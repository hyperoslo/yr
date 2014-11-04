require 'action_view'

module Yr
  class Symbol
    include ActionView::Helpers::AssetUrlHelper

    attr_accessor :id, :number, :name

    def svg
      asset_url("yr/symbols/svg/#{id}.svg")
    end

    def png(size: 48)
      asset_url("yr/symbols/b#{size}/#{id}.png")
    end
  end
end
