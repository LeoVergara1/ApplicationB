require "bunny"

# Start a communication session with RabbitMQ
conn = Bunny.new("amqps://csaizoxi:qv_k0WA2C6LxW62pKsOnacjGQhgnBaXN@coyote.rmq.cloudamqp.com/csaizoxi")
conn.start

ch   = conn.create_channel
q = ch.queue("brandon")
q.subscribe(:manual_ack => true, :block => true) do |delivery_info, properties, payload|
  puts "Message received..."
  sleep 5
  puts "Received #{payload}, message properties are #{properties.inspect}"
end

