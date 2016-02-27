require 'data_mapper'
require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'
require 'date'



class Booking
  include DataMapper::Resource

  attr_reader :calculate_stay, :calculate_price

  property  :id, Serial
  property  :start_date, String
  property  :end_date, String
  property  :message, Text
  property  :guest_number, Integer
  property  :confirmed, String

  belongs_to :space
  belongs_to :user

  def calculate_stay
    start_date = Date.parse(self.start_date)
    end_date = Date.parse(self.end_date)
    return (end_date - start_date)+1
  end

  # def calculate_price
  #   (self.calculate_stay).to_i * (self.space.price).to_i
  # end

end


