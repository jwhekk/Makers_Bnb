describe Calendar  do

subject(:calendar) { described_class.new }
  let!(:calendar) do
    Calendar.create(year_spaces: '2016')
  end

  it 'has a year' do
    expect(calendar.year_spaces).to eq '2016'
  end

end