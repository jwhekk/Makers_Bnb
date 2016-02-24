require 'data_mapper'
require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'


class BookingRequest
  include DataMapper::Resource


  property  :id, Serial
  property  :start_date, String
  property  :end_date, String
  property  :message, Text
  property  :guest_number, Integer

  # belongs_to :user
  # belongs_to :space


end
