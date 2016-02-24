describe BookingRequest do

  let!(:request) do
    BookingRequest.create(start_date: '01/01/2016',
                    end_date: '07/01/2016',
                    message: "Hello, can I rent your place",
                    guest_number: 2
                    )
  end

  it'Returns a start date' do
    expect(request.start_date).to eq ('01/01/2016')
  end

  it'Returns an end date' do
    expect(request.end_date).to eq ('07/01/2016')
  end

  it'Returns a message' do
    expect(request.message).to eq ('Hello, can I rent your place')
  end

  it'Returns a guest_number' do
    expect(request.guest_number).to eq (2)
  end

end

