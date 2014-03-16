module VRBO
  class Availability

    attr_accessor :first, :duration, :errors

    def initialize(dates = [])
      if dates.try(:any?)
        self.first = Date.parse(dates.shift)
        self.duration = self.calc_duration(dates)
        self.errors = []
      else
        self.first = Date.today
        self.duration = 1
        self.errors = %w[Maybe... But likely there was an error]
      end
    end

    def calc_duration(dates)
      1 + dates.each_with_index.sum { |the_date, i| Date.parse(the_date) - (first + i.days) == 1 ? 1 : 0 }
    end
  end
end