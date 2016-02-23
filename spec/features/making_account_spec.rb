# User Story 3:
# As a potential host,
# so i can rent out a space,
# I want to be able to make an account

feature "making account" do
  scenario "creating my account" do
  expect(User.count).to eq (0)
  visit '/'
  click_button('Sign Up')
  expect(current_path).to eq '/sign_up'
  expect(page.status_code).to eq (200)
  fill_in :first_name, with: 'Barry'
  fill_in :second_name, with: 'Grubb'
  fill_in :email, with: 'Barry@makersacademy.com'
  fill_in :password, with: 'Super Secret Password'
  fill_in :password_confirmation, with: 'Super Secret Password'
  fill_in :username, with: 'Bazza'
  click_button('Submit')
  expect(current_path).to eq '/'
  expect(User.count).to eq (1)
  end
end


