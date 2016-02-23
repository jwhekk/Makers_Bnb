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

  scenario 'Spaces needs to have a name' do
    visit '/'
    click_button('List a Space')
    fill_in 'description', with: 'very big lots of space'
    fill_in 'price', with: 20
    fill_in 'street', with: '13 London street'
    fill_in 'city', with: 'London'
    expect{click_button('Submit')}.not_to change(Space, :count)
    expect(page).to have_content('Name must not be blank')
  end

  scenario 'Spaces needs to have a description' do
    visit '/'
    click_button('List a Space')
    fill_in 'name', with: 'A nice place'
    fill_in 'price', with: 20
    fill_in 'street', with: '13 London street'
    fill_in 'city', with: 'London'
    expect{click_button('Submit')}.not_to change(Space, :count)
    expect(page).to have_content('Description must not be blank')
  end

  scenario 'Spaces needs to have a price' do
    visit '/'
    click_button('List a Space')
    fill_in 'description', with: 'very big lots of space'
    fill_in 'name', with: 'Bla Bla'
    fill_in 'street', with: '13 London street'
    fill_in 'city', with: 'London'
    expect{click_button('Submit')}.not_to change(Space, :count)
    expect(page).to have_content('Price must not be blank')
  end

  scenario 'Spaces needs to have a street' do
    visit '/'
    click_button('List a Space')
    fill_in 'description', with: 'very big lots of space'
    fill_in 'price', with: 20
    fill_in 'name', with: 'Bla Bla'
    fill_in 'city', with: 'London'
    expect{click_button('Submit')}.not_to change(Space, :count)
    expect(page).to have_content('Street must not be blank')
  end

  scenario 'Spaces needs to have a city' do
    visit '/'
    click_button('List a Space')
    fill_in 'description', with: 'very big lots of space'
    fill_in 'price', with: 20
    fill_in 'street', with: '13 London street'
    fill_in 'name', with: 'Bla Bla'
    expect{click_button('Submit')}.not_to change(Space, :count)
    expect(page).to have_content('City must not be blank')
  end
end
