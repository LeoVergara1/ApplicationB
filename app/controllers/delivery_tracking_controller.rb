class DeliveryTrackingController < ApplicationController

  def shipp
    render json: {"nombre" => "Germán"}
  end

  def satatus_delivery
    render json: {"status" => DeliveryStatus::EXCEPTION}
  end

  def rate
    body = JSON.parse(request.body.read)
    delivery = instance_delivery(body["delivery"])
    shipping = delivery.parser_body(body)
    rate = delivery.rate(shipping).first
    render json: rate
  end

  def tracking
  end

  def instance_delivery(delivery)
    case delivery
    when "fdex"
      FedexManager.instance
    else
      raise ArgumentError, 'The argument not valid'
    end
  end

end