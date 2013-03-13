# https://github.com/timcraft/percentage
require 'percentage'

module Achievements
  class ValueInfo < Struct.new(:data, :path, :rangeFrom, :rangeTo)
  end

  class Achievement
    def initialize(info)
      @info = info
    end

    def getPercentage
      value = getValueByPath

      return 0 if (value <= @info.rangeFrom)
      return 100 if (value >= @info.rangeTo)

      p = Percentage.new(Rational(value, @info.rangeTo))
      i = p.to_i

      return i if !p.zero? && i > 1
      1
    end

    private

    def getValueByPath
      localData = @info.data

      @info.path.split('/').each do |p|
        # either use the symbol or the string as key
        key = p.to_sym
        key = p.to_s unless localData.key? key

        localData = localData.fetch(key)
      end

      localData.to_i
      
    rescue
      0
    end
  end
end