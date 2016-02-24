class Request
  include DataMapper::Resource
\

  property  :id, Serial
  property  :Start_date, Date
  property  :End_date, Date
  property  :Message, Text
  property  :Guest_number, Integer

  belongs_to :user, :required => true
  belongs_to :space, :required => true


end
