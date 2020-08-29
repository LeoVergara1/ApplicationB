class DeliveryTrackingController < ApplicationController

  def shipp
    render json: {"nombre" => "Germán"}
  end

  def satatus_delivery
    delivery = instance_delivery(params["delivery"])
    response = delivery.tracking(params["tracking_number"])
    case response
    when DeliveryStatus::EXCEPTION
      render json: {"status" => DeliveryStatus::EXCEPTION}, status: 404
    else
      render json: {"status" => response}
    end
  end

  def rate
    body = JSON.parse(request.body.read)
    delivery = instance_delivery(body["delivery"])
    shipping = delivery.parser_body(body)
    rate = delivery.rate(shipping).first
    render json: rate
  end

  def tracking
    delivery = instance_delivery(params["delivery"])
    response = delivery.tracking_info(params["tracking_number"])
    case response
    when DeliveryStatus::EXCEPTION
      render json: {"status" => DeliveryStatus::EXCEPTION}, status: 404
    else
      render json: response
    end
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