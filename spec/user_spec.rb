require_relative '../app/models/user'

describe User do
  # subject(:user){described_class.new}
  let!(:user) do
    User.create(first_name: 'Valentina',
                second_name: 'Monetta',
                username: 'Logo',
                email: 'valentina@makersacademy.com',
                password: 'Super Secret Password',
                password_confirmation: 'Super Secret Password2')
  end

  it 'Has a first name' do
    expect(user.first_name).to eq('Valentina')
  end

  it 'Has a second name' do
    expect(user.second_name).to eq('Monetta')
  end

  it 'Has a username' do
    expect(user.username).to eq('Logo')
  end

end
