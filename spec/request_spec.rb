describe Booking do

  let(:space) { double :space, :price => 7, :id => 1}
  # space = double()
  # space.stub(:price) {7}

  # @space = Space.create(name: "A nice space",
  #                   description: "It's great",
  #                   price: 7,
  #                   street: "A street",
  #                   city: "A city",
  #                   host_email: "1@1.com")

  let!(:booking) do
    Booking.create(start_date: '01/01/2016',
                    end_date: '07/01/2016',
                    message: "Hello, can I rent your place",
                    guest_number: 2
                    # space: @space
                    )
  end

  it'Returns a start date' do
    expect(booking.start_date).to eq ('01/01/2016')
  end

  it'Returns an end date' do
    expect(booking.end_date).to eq ('07/01/2016')
  end

  it'Returns a message' do
    expect(booking.message).to eq ('Hello, can I rent your place')
  end

  it'Returns a guest_number' do
    expect(booking.guest_number).to eq (2)
  end

  it 'calculates the length of the stay' do
    expect(booking.calculate_stay).to eq (7)
  end
  
end
