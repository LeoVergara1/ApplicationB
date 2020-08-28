require 'singleton'
require 'fedex'

class FedexManager < DeliveryFactory
  include Singleton

  def initialize
    @fedex = Fedex::Shipment.new(:key => 'O21wEWKhdDn2SYyb',
                                 :password => 'db0SYxXWWh0bgRSN7Ikg9Vunz',
                                 :account_number => '510087780',
                                 :meter => '119009727',
                                 :mode => 'test')
  end

  def tracking(tracking_number)
    @fedex.track(:tracking_number => tracking_number)
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
end