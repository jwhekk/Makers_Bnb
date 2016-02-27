feature 'Making a request' do

  scenario "Allows a renter to make a request" do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up_second_user
    visit '/'
    make_a_request
    expect(page).to have_content('A nice place')
    expect(page).to have_content('01/01/2016')
    expect(page).to have_content('07/01/2016')
    expect(page).to have_content('Hello, can I rent your place')
    expect(page).to have_content('2')
    expect(page).to have_content('unconfirmed')


  end

  scenario 'calculates the price of the stay' do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up_second_user
    visit '/'
    make_a_request
    expect(page).to have_content('Price: 140')
  end

  scenario "Allows a potential renter to have a request confirmed" do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up_second_user
    visit '/'
    make_a_request
    click_button('Log out')
    log_in
    click_button('Your hosting requests')
    click_button('Confirm')
    click_button('Log out')
    log_in_second_user
    click_button('Your requests')
    expect(page).to have_content('Request Confirmed')

  end

  scenario "Allows a potential renter to delete a denied request" do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up_second_user
    visit '/'
    make_a_request
    click_button('Log out')
    log_in
    click_button('Your hosting requests')
    click_button('Deny')
    click_button('Log out')
    log_in_second_user
    click_button('Your requests')
    click_button('Delete request')
    expect(current_path).to eq ('/your_requests')
    expect(page).not_to have_content('A nice place')
    end


end
