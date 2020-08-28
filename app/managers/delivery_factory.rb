class DeliveryFactory 

  def tracking
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def delivered
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end