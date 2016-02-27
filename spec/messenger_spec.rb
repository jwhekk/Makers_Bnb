require_relative '../app/controllers/messenger'

describe Messenger do

  subject(:messenger) { described_class.new}

  it {is_expected.to respond_to(:send_booking_confirmation_text)}

  it {is_expected.to respond_to(:send_request_denied_text)}

  # it {is_expected.to respond_to(:send_booking_request_to_host)}

end