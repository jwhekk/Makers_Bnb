class Space
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :description, Text, required: true
  property :price, String, required: true
  property :street, String, required: true
  property :city, String, required: true
  property :host_email, String
end
