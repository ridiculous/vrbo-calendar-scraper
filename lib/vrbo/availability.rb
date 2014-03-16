module VRBO
  class Availability

    attr_accessor :start_at, :duration, :error

    def initialize(dates = [])
      dates = dates || []
      if dates.any?
        @start_at = Date.parse(dates.shift)
      else
        @start_at = Date.today
        @error = 'Maybe... But likely there was an error.'
      end
      @duration = calc_duration(dates)
    end

    def calc_duration(dates)
      1 + dates.each_with_index.sum { |the_date, i| Date.parse(the_date) - (start_at + i) == 1 ? 1 : 0 }
    end
  end
end