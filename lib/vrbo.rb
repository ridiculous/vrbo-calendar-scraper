require 'date'
require 'uri'
require 'net/https'
require 'mechanize'
require 'vrbo/version'

module VRBO
  module_function

  def configure
    yield config
  end

  def config
    @config ||= Configuration.new
  end

  def reset_config
    @config = nil
  end

  autoload :Configuration, 'vrbo/configuration'
  autoload :Availability, 'vrbo/availability'
  autoload :Calendar, 'vrbo/calendar'
end
