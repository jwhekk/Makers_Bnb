require 'data_mapper'
require_relative '../data_mapper_setup'
require 'dm-validations'

class SpaceCalendar
  include DataMapper::Resource

  belongs_to :space

  property :id,           Serial
  property :year,         String
  property :availability, Text

end
