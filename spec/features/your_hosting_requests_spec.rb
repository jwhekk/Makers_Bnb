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
  end
end