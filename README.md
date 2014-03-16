# Vrbo

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'vrbo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vrbo

## Usage

If you're just working with one calendar, then you can specify the VRBO calendar id in an initializer:

    VRBO.configure do |config|
      config.calendar_id = 293021
    end

Then to lookup available dates:

    VRBO::Calendar.find_all_available_dates

This will return an array of dates that are available. To see if your dates are available:

    VRBO::Calendar.available?(Date.today, Date.tomorrow)

You can optionally pass a third param, array of dates, to search by instead of the in memory list.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
