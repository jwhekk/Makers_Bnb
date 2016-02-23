require 'data_mapper'
require_relative '../data_mapper_setup'

class User
   include DataMapper::Resource

   property :id, Serial
   property :first_name, String, required: true
   property :second_name, String, required: true
   property :email, String, required: true, unique: true
   property :password_digest, Text, required: true

  def password=(password)
  self.password_digest=BCrypt::Password.create(password)
  end

end
