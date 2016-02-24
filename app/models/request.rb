class Request
  include DataMapper::Resource
\

  property  :id, Serial
  property  :start_date, String
  property  :end_date, String
  property  :message, Text
  property  :guest_number, Integer

  belongs_to :user
  belongs_to :space


end
