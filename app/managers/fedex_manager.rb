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

  def tracking
    p "Helo word"
  end
end