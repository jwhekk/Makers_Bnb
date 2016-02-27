require 'twilio-ruby'
require 'dotenv'


class Messenger
  def initialize
    @codes = Dotenv.load
  end


  def send_booking_confirmation_text(name)


    account_sid = @codes["account_sid"]
    auth_token = @codes["auth_token"]


    @client = Twilio::REST::Client.new account_sid, auth_token



    from = "+33644607099"

    friends = { @codes["my_number"] => "David Parry"}


    friends.each do |key, value|
      @client.account.messages.create(
      from: from,
      to: key,
      body: "Thank you! Your booking for #{name} is confirmed"
      )
      puts "Sent message to #{value}"
    end
  end


  def send_request_denied_text(space)

    account_sid = @codes["account_sid"]
    auth_token = @codes["auth_token"]


   @client = Twilio::REST::Client.new account_sid, auth_token

    from = "+33644607099"

    friends = { @codes["my_number"] => "David Parry"}


    friends.each do |key, value|
      @client.account.messages.create(
      from: from,
      to: key,
      body: "Sorry, the host refused your request for #{space}!"
      )
      puts "Sent message to #{value}"
    end

  end

end


