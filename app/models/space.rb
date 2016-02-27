require 'data_mapper'
require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'


class Space
  include DataMapper::Resource


  has n, :bookings, through: Resource
  belongs_to :user, :required => false


  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, String, required: true
  property :street, String, required: true
  property :city, String, required: true
  property :host_email, String

end
