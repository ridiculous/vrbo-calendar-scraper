module VRBO
  class Availability

    attr_reader :start_at, :dates

    # @param [Array] dates list of date strings
    def initialize(dates = nil)
      @dates = Array(dates)
      if @dates.any?
        @start_at = Date.parse(@dates.shift)
      else
        @start_at = Date.today
      end
    end

    # @note assumes @dates are in ascending order
    def duration
      i = -1
      count = 1
      dates.each do |the_date|
        diff = Date.parse(the_date) - (start_at + (i += 1))
        if diff.to_i == 1
          count += 1
        else
          break
        end
      end
      count
    end
  end
end
