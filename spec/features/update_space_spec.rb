feature 'user can update a space' do
  scenario 'user can click to edit a space' do
    make_a_space
    within'ul#spaces_list' do
      click_button('Edit')
    end
    expect(page).to have_content 'A nice place'



  end



end
