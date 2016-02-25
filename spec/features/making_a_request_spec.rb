feature 'Making a request' do

  scenario "Allows a renter to make a request" do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up2
    visit '/'
    click_button('Make a request')
    expect(current_path).to eq('/making_a_request')
    expect(page).to have_content('A nice place')
    fill_in('Start_date', with: "01/01/2016")
    fill_in('End_date', with: "07/01/2016")
    fill_in('Message', with: "Hello, can I rent your place")
    fill_in('Guest_number', with: 2 )
    click_button('Submit request')
    expect(page).to have_content('A nice place')
    expect(page).to have_content('01/01/2016')
    expect(page).to have_content('07/01/2016')
    expect(page).to have_content('Hello, can I rent your place')
    expect(page).to have_content('2')

  end

  it 'calculates the price of the stay' do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up2
    visit '/'
    click_button('Make a request')
    expect(current_path).to eq('/making_a_request')
    expect(page).to have_content('A nice place')
    fill_in('Start_date', with: "01/01/2016")
    fill_in('End_date', with: "07/01/2016")
    fill_in('Message', with: "Hello, can I rent your place")
    fill_in('Guest_number', with: 2 )
    click_button('Submit request')
    expect(page).to have_content('Price: 140')
  end

end
