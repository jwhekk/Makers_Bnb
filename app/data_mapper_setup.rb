require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-constraints'

require_relative 'models/request'
require_relative 'models/user'
require_relative 'models/space'
require_relative 'models/space_calendar'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||
  "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")

DataMapper.finalize
