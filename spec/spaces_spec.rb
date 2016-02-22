describe Space do

  subject(:space) { described_class.new }
  let!(:space) do
    Space.create(name: 'A nice place')
  end

  it'Returns a name' do
    expect(space.name).to eq ('A nice place')
  end

end
