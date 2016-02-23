def sign_up
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
end
