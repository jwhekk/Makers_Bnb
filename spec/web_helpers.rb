def make_a_space
    visit '/'
    click_button('List a Space')
    fill_in 'name', with: 'A nice place'
    fill_in 'description', with: 'very big lots of space'
    fill_in 'price', with: 20
    fill_in 'street', with: '13 Liverpool street'
    fill_in 'city', with: 'London'
    click_button('Submit')
end

def make_a_space_second_user
    visit '/'
    click_button('List a Space')
    fill_in 'name', with: 'Een mooie plek'
    fill_in 'description', with: 'aan het water in het bos'
    fill_in 'price', with: 20
    fill_in 'street', with: 'Bosweg 34'
    fill_in 'city', with: 'Gorssel'
    click_button('Submit')
end

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

def sign_up_second_user
  visit '/'
  click_button('Sign Up')
  expect(current_path).to eq '/sign_up'
  expect(page.status_code).to eq (200)
  fill_in :first_name, with: 'Piet'
  fill_in :second_name, with: 'Jansen'
  fill_in :email, with: 'password_digest@makersacademy.com'
  fill_in :password, with: 'Super Secret Password'
  fill_in :password_confirmation, with: 'Super Secret Password'
  fill_in :username, with: 'Pijan'
  click_button('Submit')
end

def sign_up_third_user
  visit '/'
  click_button('Sign Up')
  expect(current_path).to eq '/sign_up'
  expect(page.status_code).to eq (200)
  fill_in :first_name, with: 'Dave'
  fill_in :second_name, with: 'Parry'
  fill_in :email, with: 'email@email.com'
  fill_in :password, with: 'Super Secret Password'
  fill_in :password_confirmation, with: 'Super Secret Password'
  fill_in :username, with: 'Davo'
  click_button('Submit')
end


def make_a_request
  click_button('Make a request')
  fill_in('Start_date', with: "01/01/2016")
  fill_in('End_date', with: "07/01/2016")
  fill_in('Message', with: "Hello, can I rent your place")
  fill_in('Guest_number', with: 2 )
  click_button('Submit request')
end

def log_in
  click_button('Log in')
  fill_in :email, with: 'Barry@makersacademy.com'
  fill_in :password, with: 'Super Secret Password'
  click_button('Log in')
end

def log_in_second_user
  click_button('Log in')
  fill_in :email, with: 'password_digest@makersacademy.com'
  fill_in :password, with: 'Super Secret Password'
  click_button('Log in')
end

def make_a_request
  click_button('Make a request')
  expect(current_path).to eq('/making_a_request')
  expect(page).to have_content('A nice place')
  fill_in('Start_date', with: "01/01/2016")
  fill_in('End_date', with: "07/01/2016")
  fill_in('Message', with: "Hello, can I rent your place")
  fill_in('Guest_number', with: 2 )
  click_button('Submit request')
  end

  def make_a_request_second_user
  click_button('Make a request')
  expect(current_path).to eq('/making_a_request')
  expect(page).to have_content('A nice place')
  fill_in('Start_date', with: "02/01/2016")
  fill_in('End_date', with: "04/01/2016")
  fill_in('Message', with: "Yellow")
  fill_in('Guest_number', with: 2 )
  click_button('Submit request')
  end




