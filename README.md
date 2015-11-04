# VRBO Calendar Scraper

Uses mechanize to scrape a VRBO calendar and return a list of available dates. For instance, the gem can
scrape this calendar: [http://www.vrbo.com/293021/calendar](http://www.vrbo.com/293021/calendar)

## Installation

    $ gem install vrbo

## Usage

If you're just working with one calendar, then you can specify the VRBO calendar id in an initializer:

```ruby
# config/initializers/vrbo.rb
VRBO.configure do |config|
  config.calendar_id = 293021
end
```

Then to lookup available dates and see if a date range is available:

```ruby
calendar = VRBO::Calendar.new
calendar.available?(Date.today, Date.today + 5)
#=> true/false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
