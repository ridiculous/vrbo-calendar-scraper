$: << 'test'
require 'minitest/autorun'
require 'vrbo'
require 'support/calendar_dates'

class AvailabilityTest < MiniTest::Unit::TestCase
  include CalendarDates

  def test_new_with_params
    availability = VRBO::Availability.new(all << (tomorrow + 2).to_s)
    assert_equal today, availability.start_at
    assert_equal 2, availability.duration
    assert_nil availability.error
  end

  def test_new_without_params
    availability = VRBO::Availability.new
    assert_equal today, availability.start_at
    assert_equal 1, availability.duration
    assert_includes availability.error, 'error'
  end

end