# VRBO Calendar Scraper

Uses mechanize to scrape a VRBO calendar and return a list of available dates. For instance, the gem can
scrape this calendar: [http://www.vrbo.com/293021/calendar](http://www.vrbo.com/293021/calendar)

## Installation

    $ gem install vrbo

## Usage

Specify the VRBO calendar ID in an initializer:

```ruby
# config/initializers/vrbo.rb
VRBO.configure do |config|
  config.calendar_id = 293021
end
```

Lookup available dates:

```ruby
calendar = VRBO::Calendar.new
calendar.available_dates #=> ["2015-11-03", "2015-11-04", "2015-11-05", ...]
```

Check availability:

```ruby
calendar.available?(Date.today, Date.today + 5) #=> true/false
```

### Multiple Calendars

In the case of multiple calendars it makes more sense to skip the initializer part and pass the the calendar ID on
initialization:

```ruby
VRBO::Calendar.new 293021
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
