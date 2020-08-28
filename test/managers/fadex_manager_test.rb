require 'test_helper'

class ParserManagerTest < ActiveSupport::TestCase
  @@fedex_manager = FedexManager.instance

  test "check instance" do
    assert @@fedex_manager
  end

  test "get model with parmas" do
    shipping_fedex = initFedexModel
    shipper = { :name => "Sender",
      :company => "Company",
      :phone_number => "555-555-5555",
      :address => "Main Street",
      :city => "Harrison",
      :state => "AR",
      :postal_code => "72601",
      :country_code => "US" }
    assert shipping_fedex.shipper = shipper
  end

  def initFedexModel
    shipper = { :name => "Sender",
      :company => "Company",
      :phone_number => "555-555-5555",
      :address => "Main Street",
      :city => "Harrison",
      :state => "AR",
      :postal_code => "72601",
      :country_code => "US" }
    recipient = { :name => "Recipient",
        :company => "Company",
        :phone_number => "555-555-5555",
        :address => "Main Street",
        :city => "Franklin Park",
        :state => "IL",
        :postal_code => "60131",
        :country_code => "US",
        :residential => "false" }
    packages = []
    packages << {
        :weight => {:units => "LB", :value => 6},
        :dimensions => {:length => 5, :width => 5, :height => 4, :units => "IN" }
    }
    shipping_options = {
      :packaging_type => "YOUR_PACKAGING",
      :drop_off_type => "REGULAR_PICKUP"
    }
    ShippingFedex.new(shipper, recipient, packages, shipping_options)
  end

end