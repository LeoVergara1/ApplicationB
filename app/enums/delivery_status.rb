module DeliveryStatus
  CREATED = "CREATED"
  ON_TRANSIT = "ON_TRANSIT"
  DELIVERED = "DELIVERED"
  EXCEPTION = "EXCEPTION"

  def self.delivery_status(status)
    case status
    when /\ADELIVERED|Completed/
      DeliveryStatus::CREATED
    when /\ACREATED/
      DeliveryStatus::CREATED
    when /\AON_TRANSIT/
      DeliveryStatus::ON_TRANSIT
    else
      DeliveryStatus::EXCEPTION
    end
  end
end