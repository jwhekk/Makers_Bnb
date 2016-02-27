require 'twilio-ruby'
require 'dotenv'

class Messenger
  def initialize
    @env = Dotenv.load
  end

  def send_booking_confirmation_text
    client = Twilio::REST::Client.new @env["account_sid"],@env["auth_token"]

    friends.each do |key, value|
      client.account.messages.create(
        from: @env[my_twilio_number],
        to: @env[my_number],
        body: "Thank you! Your booking is confirmed"
        )
      puts "Sent message to #{value}"
    end
  end

  def send_request_denied_text
    client = Twilio::REST::Client.new @env["account_sid"],@env["auth_token"]

    friends.each do |key, value|
      client.account.messages.create(
        from: @env[my_twilio_number],
        to: @env[my_number],
        body: "Sorry, the host refused your request!"
        )
      puts "Sent message to #{value}"
    end

  end

# def send_booking_request_to_host
#     client = Twilio::REST::Client.new @env["account_sid"],@env["auth_token"]

#     friends.each do |key, value|
#       client.account.messages.create(
#         from: @env[my_twilio_number],
#         to: @env[my_number],
#         body: "You have a new booking request!"
#         )
#       puts "Sent message to #{value}"
#     end


end