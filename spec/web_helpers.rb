def make_a_space
    visit '/'
    click_button('List a Space')
    fill_in 'name', with: 'A nice place'
    fill_in 'description', with: 'very big lots of space'
    fill_in 'price', with: 20
    fill_in 'street', with: '13 London street'
    fill_in 'city', with: 'London'
    click_button('Submit')

end