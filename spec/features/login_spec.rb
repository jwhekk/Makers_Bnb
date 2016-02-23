# User Story 1:
# As a user,
# so I can access my own spaces,
# I want to be able to login

feature 'log in' do

  before(:each) do
    User.create(email: 'valentina@makersacademy.com',
                first_name: 'Valentina',
                second_name: 'Monetta',
                username: 'Logo',
                password: 'Super Secret Password',
                password_confirmation: 'Super Secret Password')
  end

  scenario 'I can log in to my account' do
    visit '/'
    click_button('Log in')
    fill_in :email, with: 'valentina@makersacademy.com'
    fill_in :password, with: 'Super Secret Password'
    click_button('Log in')
    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome, Valentina.')
  end

  scenario 'I cannot log in with a non-existing email' do
    visit '/'
    expect(User.count).to eq (1)
    click_button('Log in')
    fill_in :email, with: 'non_existing_email@makersacademy.com'
    fill_in :password, with: 'Super Secret Password'
    click_button('Log in')
    expect(current_path).to eq('/log_in')
    expect(page.status_code).to eq 200
    expect(User.count).to eq (1)
    expect(page).to have_content('The email or password is incorrect
')

  end

  scenario 'I cannot log in with an incorrect password' do
    visit '/'
    expect(User.count).to eq (1)
    click_button('Log in')
    fill_in :email, with: 'valentina@makersacademy.com'
    fill_in :password, with: 'Incorect Password'
    click_button('Log in')
    expect(current_path).to eq('/log_in')
    expect(page.status_code).to eq 200
    expect(User.count).to eq (1)
    expect(page).to have_content('The email or password is incorrect
')

  end
end
