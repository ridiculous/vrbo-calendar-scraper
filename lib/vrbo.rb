# external libraries
require 'mechanize'
require 'uri'
require 'net/https'

# our stuff
require "vrbo/version"
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