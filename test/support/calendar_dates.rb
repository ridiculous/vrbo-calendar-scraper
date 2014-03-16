module CalendarDates

  module Stubs
    def collect_days_for_month(date)
      dates = date.upto(date.next_month).to_a
      dates.map(&:day).map(&:to_s).take(3)
    end
  end

  def available?(list, a = today, b = tomorrow)
    vrbo_calendar.available?(a, b, list)
  end

  def all
    prep [today, tomorrow]
  end

  def random
    prep all.shuffle
  end

  def arrival_only
    prep [today]
  end

  def depart_only
    prep [tomorrow]
  end

  def prep(list)
    list.map(&:to_s)
  end

  def today
    @today ||= Date.today
  end

  def tomorrow
    @tomorrow ||= today + 1
  end

  def vrbo_calendar
    @vrbo_calendar ||= VRBO::Calendar.prepend(Stubs).new
  end
end