require 'data_mapper'
require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class Calendar
  include DataMapper::Resource

  property :id, Serial
  property :year_spaces, String, required: true

end