require_relative '../app/models/space_calendar'
describe SpaceCalendar  do

# subject(:space_calendar) { described_class.new }
  let!(:space_calendar) do
    SpaceCalendar.create(year: '2016',
                          availability: status)
  end

  it 'has a year' do
    expect(space_calendar.year).to eq '2016'
  end

  it 'has a availability string for each year' do
    expect(space_calendar.availability[45]).to eq "a"
  end

  it 'can update the status' do
    july_free
    expect(space_calendar.availability[190]).to eq "b"
  end

end
 
