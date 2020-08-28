require 'singleton'

class FedexManager < DeliveryFactory
  include Singleton

  def tracking
    p "Helo word"
  end
end