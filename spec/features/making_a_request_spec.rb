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

  end

  it 'calculates the price of the stay' do
    sign_up
    make_a_space
    click_button('Log out')
    sign_up_second_user
    visit '/'
    make_a_request
    expect(page).to have_content('Price: 140')
  end

end
