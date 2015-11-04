module VRBO
  class Calendar

    attr_accessor :id, :days

    def initialize(calendar_id = nil)
      @id = calendar_id || VRBO.config.calendar_id
      @days = {}
      @available_dates = nil
    end

    def available_dates
      @available_dates ||= today.upto(today + 365).map { |date| date_if_available(date) }.compact
    end

    # @description exclusive, drops day from departure because bookings usually go on per nightly
    def available?(arrival, depart, dates = nil)
      dates = dates || available_dates
      available = dates.any?
      arrival.upto(depart - 1).each do |date|
        available = false unless dates.include?(date.to_s)
      end
      available
    end

    def url(protocol = 'http')
      if id
        "#{protocol}://www.vrbo.com/#{id}/calendar"
      else
        fail ArgumentError, 'calendar_id is required! You can initialize with a calendar_id or configure the module VRBO'
      end
    end

    #
    # Private
    #

    def today
      @today ||= Date.respond_to?(:current) ? Date.current : Date.today
    end

    def date_if_available(date)
      m = date.month.to_s
      days[m] ||= collect_days_for_month(date)
      date.to_s if days[m].include?(date.day.to_s)
    end

    def collect_days_for_month(date)
      table = calendar.search('.cal-month').at("//b[contains(text(), '#{date.strftime('%B %Y')}')]/following-sibling::table")
      table.search('td:not(.strike)').map { |cell| cell.children.to_s.strip }
    rescue => e
      puts e.class
      puts e.message
      puts e.backtrace
      puts calendar: calendar
    end

    def calendar
      @calendar ||= Mechanize.start do |agent|
        agent.open_timeout = 10
        agent.read_timeout = 10
        agent.follow_meta_refresh = true
        agent.keep_alive = true
        agent.max_history = 1
        agent.user_agent_alias = 'Mac Safari'
        agent.get(url).parser
      end
    end
  end
end
