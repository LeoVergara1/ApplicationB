require 'singleton'
require 'fedex'
require "bunny"

class FedexManager < DeliveryFactory
  include Singleton

  def initialize
    @fedex = Fedex::Shipment.new(:key => 'O21wEWKhdDn2SYyb',
                                 :password => 'db0SYxXWWh0bgRSN7Ikg9Vunz',
                                 :account_number => '510087780',
                                 :meter => '119009727',
                                 :mode => 'test')

    @conn = Bunny.new("amqps://csaizoxi:qv_k0WA2C6LxW62pKsOnacjGQhgnBaXN@coyote.rmq.cloudamqp.com/csaizoxi")
    @conn.start
    @ch = @conn.create_channel
    @q  = @ch.queue("brandon")
  end

  def tracking(tracking_number)
    begin
      @fedex.track(:tracking_number => tracking_number)
    rescue => exception
      p exception
      p "Ocurrer error"
    end
  end

  def rate(shipping_fedex)
    @fedex.rate(:shipper=>shipping_fedex.shipper,
      :recipient => shipping_fedex.recipient,
      :packages => shipping_fedex.packages,
      :service_type => "FEDEX_GROUND",
      :shipping_options => shipping_fedex.shipping_options)
  end

  def ship(shipping_fedex)
    @fedex.ship(:shipper=> shipping_fedex.shipper,
      :recipient => shipping_fedex.recipient,
      :packages => shipping_fedex.packages,
      :service_type => "FEDEX_GROUND",
      :shipping_options => shipping_fedex.shipping_options)
  end

  def find
    @q.publish("Hello, everybody #{Time.new}!")
  end
end
