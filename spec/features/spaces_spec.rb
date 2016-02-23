feature 'user can list a space' do
  scenario 'users can fill in a form to register a space' do
    visit '/'
    click_button('List a Space')
    fill_in 'name', with: 'A nice place'
    fill_in 'description', with: 'very big lots of space'
    fill_in 'price', with: 20
    fill_in 'street', with: '13 London street'
    fill_in 'city', with: 'London'
    click_button('Submit')
    expect(page).to have_content('A nice place')
    expect(page).to have_content('very big lots of space')
    expect(page).to have_content(20)
    expect(page).to have_content('13 London street')
    expect(page).to have_content('London')
  end
end
