require_relative '../app/controllers/calendar.rb'
require_relative '../app/models/space_calendar'
require_relative '../app/models/space'
include Calendar_helpers

describe 'calendar controller' do

  let!(:space) do
    Space.create(name: 'A nice place')
  end

  let(:start_date) { "2016-03-10"}
  let(:end_date) { "2016-03-24"}
  let(:date) { "2016-02-01"}


  let!(:space_calendar) do
    create_calendar
  end



  it 'is created all available by default' do
    expect(space_calendar.availability[134]).to eq 'b'
  end

  it { is_expected.to respond_to :update_calendar }

  xit 'change status to required when a request is made' do
    space_calendar.update_calendar(start_date,end_date)
    expect( space_calendar.availability[75]).to eq 'c'
  end

  it { is_expected.to respond_to :prepare_calendar }

  it 'returns the array with the year_day2' do
    space.space_calendars << create_calendar
    array = space_calendar.prepare_calendar(date, space)
    expect(array[0]).to eq '2016'
  end

  it 'returns the array with the month' do
    space.space_calendars << create_calendar
    array = space_calendar.prepare_calendar(date, space)
    expect(array[1]).to eq 'February'
  end

  it 'returns the array with the days' do
    space.space_calendars << create_calendar
    array = space_calendar.prepare_calendar(date, space)
    expect(array[2][0]).to eq [0,'z']
    expect(array[2][1]).to eq [1,'b']
    expect(array[2][11]).to eq [11,'b']
    expect(array[2][29]).to eq [29,'b']
    expect(array[2][30]).to eq [0,'z']
  end
end
