require 'vrbo/class_methods'

module VRBO
  class Calendar
    extend ClassMethods

    attr_accessor :id, :available_dates, :days

    def initialize(calendar_id = nil)
      @id = calendar_id || VRBO.config.calendar_id
      @days = {}
      @available_dates = []
    end

    def available?(arrival, depart, my_dates = nil)
      dates = my_dates || available_dates
      available = dates.any?
      arrival.upto(depart - 1).each do |date|
        available = false unless dates.include?(date.to_s)
      end
      available
    end

    def find_available_dates
      today = Date.today
      @available_dates = today.upto(today + 365).map { |date| date_if_available(date) }.compact
    end

    def url(protocol = 'http')
      if id
        "#{protocol}://www.vrbo.com/#{id}/calendar"
      else
        raise ArgumentError, 'You must provide a calendar id'
      end
    end

    alias :find_all_available_dates :find_available_dates

    private

    def date_if_available(date)
      m = date.month.to_s
      days[m] ||= collect_days_for_month(date)
      date.to_s if days[m].include?(date.day.to_s)
    end

    def collect_days_for_month(date)
      scrape_table_for(date).map { |cell| cell.children.to_s.strip }
    end

    def scrape_table_for(date)
      calendar.search('.cal-month').at(table_xpath(date)).search('td:not(.strike)')
    end

    def calendar
      @calendar ||= agent.get(url)
    end

    def agent
      @agent ||= Mechanize.new
    end

    # e.g. March 2014
    def table_xpath(date)
      "//b[contains(text(), '#{date.strftime('%B %Y')}')]/following-sibling::table"
    end
  end
end