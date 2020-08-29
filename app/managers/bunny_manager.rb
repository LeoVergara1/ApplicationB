require "bunny"
require 'singleton'

class BunnyManager
  include Singleton

  def initialize
    @conn = Bunny.new(Rails.application.secrets.bunny[:url])
    @conn.start
    @ch = @conn.create_channel
    @q  = @ch.queue("brandon")
  end

  def find
    @q.publish("Hello, everybody #{Time.new}!")
  end
end