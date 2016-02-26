feature 'Users can see their hosting requests' do

  scenario 'Users can see their hosting requests on the page' do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up2
    click_button('Make a request')
    fill_in('Start_date', with: "01/01/2016")
    fill_in('End_date', with: "07/01/2016")
    fill_in('Message', with: "Hello, can I rent your place")
    fill_in('Guest_number', with: 2 )
    click_button('Submit request')
    click_button('Log out')
    click_button('Log in')
    fill_in :email, with: 'Barry@makersacademy.com'
    fill_in :password, with: 'Super Secret Password'
    click_button('Log in')
    click_button('Your hosting requests')
    expect(current_path).to eq '/your_hosting_requests'
    expect(page).to have_content ('A nice place')
    expect(page).to have_content ('01/01/2016')
    expect(page).to have_content ('07/01/2016')
  end
end