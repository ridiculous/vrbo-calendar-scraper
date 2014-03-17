$: << 'test'
require 'minitest/autorun'
require 'vrbo'
require 'support/calendar_dates'

class CalendarTest < MiniTest::Unit::TestCase
  include CalendarDates

  def calendar_id
    212121
  end

  def test_available_with_all
    assert_equal true, available?(all)
  end

  def test_available_with_random
    assert_equal true, available?(random)
  end

  def test_available_with_arrival
    assert_equal true, available?(arrival_only)
  end

  def test_available_with_depart
    assert_equal false, available?(depart_only)
  end

  def test_available_with_empty
    assert_equal false, available?([])
  end

  def test_available_with_edge
    assert_equal true, available?(all, today, tomorrow + 1)
  end

  def test_available_with_exceeding
    assert_equal false, available?(all, today, tomorrow + 2)
  end

  def test_find_all_available_dates
    # 3 days taken for each month (36) + 1 day padding
    assert_equal 37, vrbo_calendar.find_available_dates.length
    assert_equal today.to_s, vrbo_calendar.available_dates.first
    assert_equal (today + 365).to_s, vrbo_calendar.available_dates.last
    assert_equal vrbo_calendar.days.length, 12
  end

  def test_passing_calendar_id
    calendar = VRBO::Calendar.new(calendar_id)
    assert_equal calendar_id, calendar.id
    assert_equal "http://www.vrbo.com/#{calendar_id}/calendar", calendar.url
    assert_equal "https://www.vrbo.com/#{calendar_id}/calendar", calendar.url('https')
  end

  def test_no_calendar_id_given
    assert_raises ArgumentError do
      VRBO::Calendar.new.url
    end
  end

  def test_calendar_id_from_config
    VRBO.configure do |config|
      config.calendar_id = calendar_id
    end
    calendar = VRBO::Calendar.new
    VRBO.reset_config
    assert_equal calendar_id, calendar.id
    assert_equal "http://www.vrbo.com/#{calendar_id}/calendar", calendar.url
  end
end