require 'data_mapper'
require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'


class Booking
  include DataMapper::Resource


  property  :id, Serial
  property  :start_date, String
  property  :end_date, String
  property  :message, Text
  property  :guest_number, Integer



end
