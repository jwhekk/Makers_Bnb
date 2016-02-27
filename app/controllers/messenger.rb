require 'twilio-ruby'
require 'dotenv'


class Messenger
  def initialize
    @env = Dotenv.load
  end

  # @account_sid = "ACc640aebc9ed667fe38f3481bab876368"
  #
  # @auth_token = "134e02cb4127679d53aaed26bd40af7d"
# if Host confirms then run send_booking_confirmation_text, otherwise run send_request_denied_text
  def send_booking_confirmation_text
    account_sid = "ACc640aebc9ed667fe38f3481bab876368"

    auth_token = "134e02cb4127679d53aaed26bd40af7d"

    client = Twilio::REST::Client.new @env["account_sid"],@env["auth_token"]

    friends = { @env["my_number"] => "+4407767831356"}
    @my_twilio_number = "+441702806346"

    friends.each do |key, value|
      client.account.messages.create(
      from: @env[@my_twilio_number],
      to: @env[my_number],
      body: "Thank you! Your booking is confirmed"
      )
      puts "Sent message to #{value}"
    end
  end


  def send_request_denied_text

    account_sid = "ACc640aebc9ed667fe38f3481bab876368"

    auth_token = "134e02cb4127679d53aaed26bd40af7d"

    client = Twilio::REST::Client.new @env["account_sid"],@env["auth_token"]

    friends = { @env["my_number"] => "+4407767831356"}
    @my_twilio_number = "+441702806346"

    friends.each do |key, value|
      client.account.messages.create(
      from: @env[@my_twilio_number],
      to: @env[my_number],
      body: "Sorry, the host refused your request!")
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

# account_sid = "ACc640aebc9ed667fe38f3481bab876368"
#
# auth_token = "134e02cb4127679d53aaed26bd40af7d"
#
# my_twilio_number = "+441702806346"
#
# friends = { @env["my_number = "+4407767831356"
