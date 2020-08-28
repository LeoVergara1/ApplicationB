class ShippingFedex

  attr_accessor :shipper, :recipient, :packages, :shipping_options

  def initialize(shipper, recipient, packages, shipping_options)
    @shipper = shipper
    @recipient = recipient
    @packages = packages
    @shipping_options = shipping_options
  end

end