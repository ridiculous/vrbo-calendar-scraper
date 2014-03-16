# VRBO Calendar Scraper

Uses mechanize to scrape a VRBO calendar and return a list of available dates. For instance, the gem can
scrape this calendar: [http://www.vrbo.com/293021/calendar](http://www.vrbo.com/293021/calendar)

## Installation

Add this line to your application's Gemfile:

    gem 'vrbo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vrbo

## Usage

If you're just working with one calendar, then you can specify the VRBO calendar id in an initializer:

    # config/initializers/vrbo_calendar.rb

    VRBO.configure do |config|
      config.calendar_id = 293021
    end

Then to lookup available dates and see if a date range is available:

    calendar = VRBO::Calendar.new
    calendar.find_all_available_dates
    calendar.available?(Date.today, Date.tomorrow)
    #=> true/false

These two methods are also available as class methods, however `available?` will then need an array of dates
as the third parameter.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
