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
    begin
      results = @fedex.track(:tracking_number => tracking_number).first
      tracking_info = results.first
      check_status(tracking_info.status)
    rescue => exception
      p exception
      DeliveryStatus::EXCEPTION
    end
  end

  def check_status(status)
    DeliveryStatus.delivery_status(status) 
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

  def parser_packages_from_json(list_packages)
    list_packages.collect do |package|
      {
        :weight => package["weight"].transform_keys(&:to_sym),
        :dimensions => package["dimensions"].transform_keys(&:to_sym)
      }
    end
  end

  def parser_body(body)
    shipper = body["shipper"].transform_keys(&:to_sym)
    recipient = body["recipient"].transform_keys(&:to_sym)
    packages = parser_packages_from_json(body["packages"])
    shipping_options = body["shipping_options"].transform_keys(&:to_sym)
    ShippingFedex.new(shipper, recipient, packages, shipping_options)
  end
end
