require_relative '../app/models/space_calendar'

describe SpaceCalendar  do

# subject(:space_calendar) { described_class.new }
  let!(:space_calendar) do
    SpaceCalendar.create(year: '2016',
                          availability: statuses)
  end

  it 'has a year' do
    expect(space_calendar.year).to eq '2016'
  end



  it 'is available by default' do
    expect(space_calendar.availability[45]).to eq "b"
  end

  it 'can update the status' do
    july_free
    expect(space_calendar.availability[190]).to eq "b"
  end

end
