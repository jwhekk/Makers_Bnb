# User Story 3:
# As a potential host,
# so i can rent out a space,
# I want to be able to make an account

feature "making an account" do

  scenario "creating an account" do
    expect(User.count).to eq (0)
    sign_up
    expect(current_path).to eq '/'
    expect(User.count).to eq (1)
  end

  scenario "creating an account with an existing email" do
    expect(User.count).to eq (0)
    sign_up
    expect(current_path).to eq '/'
    expect(User.count).to eq (1)
    click_button('Log out')
    sign_up
    expect(page).to have_content('Email is already taken')
  end

  scenario "creating an account with an existing username" do
    expect(User.count).to eq (0)
    sign_up
    expect(current_path).to eq '/'
    expect(User.count).to eq (1)
    click_button('Log out')
    sign_up
    expect(page).to have_content('Username is already taken')
  end

  scenario "creating an account with incorrect password confirmation" do
    visit '/'
    click_button('Sign Up')
    expect(current_path).to eq '/sign_up'
    expect(page.status_code).to eq (200)
    fill_in :first_name, with: 'Barry'
    fill_in :second_name, with: 'Grubb'
    fill_in :email, with: 'Barry@makersacademy.com'
    fill_in :password, with: 'Super Secret Password'
    fill_in :password_confirmation, with: 'Wrong Password'
    fill_in :username, with: 'Bazza'
    click_button('Submit')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "multiple error message can be shown on sign up page" do
    sign_up
    visit '/'
    click_button('Log out')
    click_button('Sign Up')
    expect(current_path).to eq '/sign_up'
    expect(page.status_code).to eq (200)
    fill_in :first_name, with: 'Barry'
    fill_in :second_name, with: 'Grubb'
    fill_in :email, with: 'Barry@makersacademy.com'
    fill_in :password, with: 'Super Secret Password'
    fill_in :password_confirmation, with: 'Wrong Password'
    fill_in :username, with: 'Bazza'
    click_button('Submit')
    expect(page).to have_content('Email is already taken')
    expect(page).to have_content('Username is already taken')
    expect(page).to have_content('Password does not match the confirmation')
  end
end
