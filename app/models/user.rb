require 'data_mapper'
require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class User
   include DataMapper::Resource

   attr_accessor :password_confirmation
   attr_reader :password

   validates_confirmation_of :password

   property :id, Serial
   property :first_name, String, required: true
   property :second_name, String, required: true
   property :email, String, required: true, unique: true
   property :password_digest, Text
   property :username, String, required: true, unique: true

  def password=(password)
    @password = password
    self.password_digest=BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
