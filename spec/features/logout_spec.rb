# as a logged in user
# so nobody else can use my account
# i want to be able to logout

feature 'log out' do

  before(:each) do
    User.create(email: 'valentina@makersacademy.com',
              first_name: 'Valentina',
              second_name: 'Monetta',
              username: 'Logo',
              password: 'Super Secret Password',
              password_confirmation: 'Super Secret Password')
              visit '/'
              click_button('Log in')
              fill_in :email, with: 'valentina@makersacademy.com'
              fill_in :password, with: 'Super Secret Password'
              click_button('Log in')
            end

  it 'sets current user to nil upon log out' do
    visit '/'
    click_button('Log out')
    expect(@current_user).to eq(nil)
  end

  it 'posts a Goodbye message upon log out' do
    visit '/'
    click_button('Log out')
    expect(page).to have_content('Goodbye.')
  end

  it 'takes the user back to the home page' do
    visit '/'
    click_button('Log out')
    expect(current_path).to eq ('/')
  end

end
