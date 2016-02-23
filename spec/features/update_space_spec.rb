feature 'user can update a space' do
  scenario 'user can click to edit a space' do
    make_a_space
    within("//li[@id='1']") do
      click_button('Edit')
    end
    expect(page).to have_content 'A nice place'
    expect(page).to have_content 'very big lots of space'
    expect(page).to have_content (20)
    expect(page).to have_content '13 Liverpool street'
    expect(page).to have_content 'London'

  end

  # scenario 'user can click to edit a space' do
  #   make_a_space
  #   within'ul#spaces_list' do
  #     click_button('Edit')



end
