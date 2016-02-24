feature 'user can update a space' do
  scenario 'user can click to edit a space' do
    sign_up
    make_a_space
    within(:css, 'ul li') do
      click_button('Edit')
    end

    expect(find_field('name').value).to eq ('A nice place')
    expect(find_field('description').value).to eq ('very big lots of space')
    expect(find_field('price').value).to eq ("20")
    expect(find_field('street').value).to eq ('13 Liverpool street')
    expect(find_field('city').value).to eq ('London')

  end

  scenario 'user can click to edit a space' do
    sign_up
    make_a_space
    within'ul#spaces_list' do
      click_button('Edit')
    end
    fill_in 'name', with: 'An even nicer place'

    click_button('Submit')
    expect(page).to have_content('An even nicer place')

  end
end
