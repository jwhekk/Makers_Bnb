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

def make_a_space2
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

def sign_up2
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

def status
  @status = ''
  366.times { @status  += "b"}
  @status
end

def july_free
  count = 182
  31.times do
    space_calendar.availability[count] = "b"
    count += 1
  end
end
