require 'date'
require 'uri'
require 'net/https'
require 'mechanize'

require 'vrbo/version'
require 'vrbo/configuration'
require 'vrbo/availability'
require 'vrbo/calendar'

module VRBO
  extend self

  def configure
    yield config
  end

  def config
    @config ||= Configuration.new
  end

end