feature 'Users can see their hosting requests' do

  scenario 'Users can see their hosting requests on the page' do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up_second_user
    make_a_request
    click_button('Log out')
    log_in
    click_button('Your hosting requests')
    expect(current_path).to eq '/your_hosting_requests'
    expect(page).to have_content ('A nice place')
    expect(page).to have_content ('01/01/2016')
    expect(page).to have_content ('07/01/2016')
    expect(page).to have_content ("Hello, can I rent your place")
    expect(page).to have_content (2)
  end

  scenario 'Users can confirm hosting requests' do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up_second_user
    make_a_request
    click_button('Log out')
    log_in
    click_button('Your hosting requests')
    click_button('Confirm')
    expect(page).to have_content('Request Confirmed')
  end

  scenario 'When users confirm a request, other requests are autmomatically denied' do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up_second_user
    make_a_request
    click_button('Log out')
    sign_up_third_user
    make_a_request_second_user
    click_button('Log out')
    log_in
    click_button('Your hosting requests')
    first('.confirm').click_button('Confirm')
    expect(current_path).to eq ('/your_hosting_requests')
    expect(page).not_to have_content('Yellow')

  end

end
