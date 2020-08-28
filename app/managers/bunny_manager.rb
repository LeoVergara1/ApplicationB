require "bunny"
require 'singleton'

class BunnyManager
  include singleton

  def initialize
    @conn = Bunny.new("amqps://csaizoxi:qv_k0WA2C6LxW62pKsOnacjGQhgnBaXN@coyote.rmq.cloudamqp.com/csaizoxi")
    @conn.start
    @ch = @conn.create_channel
    @q  = @ch.queue("brandon")
  end

  def find
    @q.publish("Hello, everybody #{Time.new}!")
  end
end