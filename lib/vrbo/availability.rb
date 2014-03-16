module VRBO
  class Availability

    attr_accessor :start_at, :duration, :error, :dates

    # assumes dates are in ascending order
    def initialize(the_dates = nil)
      @dates = the_dates || []
      if dates.any?
        @start_at = Date.parse(dates.shift)
      else
        @start_at = Date.today
        @error = 'Maybe... But likely there was an error.'
      end
      @duration = count_continuous_dates
    end

    def count_continuous_dates
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