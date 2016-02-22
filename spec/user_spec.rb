require_relative '../app/models/user'

describe User do
  subject(:user){described_class.new}

  it "does something" do
    expect(user.something).to eq ("hello")
  end





end