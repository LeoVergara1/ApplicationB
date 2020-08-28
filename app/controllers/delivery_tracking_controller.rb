class DeliveryTrackingController < ApplicationController

  def shipp
    render json: {"nombre" => "Germán"}
  end

  def satatus_delivery
    render json: {"status" => DeliveryStatus::EXCEPTION}
  end
end