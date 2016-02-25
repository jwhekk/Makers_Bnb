feature 'calendar' do

  scenario 'shows the availability of the space' do
    visit '/calendar'
    expect(page).to have_content'July'
  end

  # scenario 'shows the updated availability' do
  #   visit '/calendar'
  #   expect(page).to have_css('tr.b')
  # end


# scenario 'shows when the places is requested' do
#     visit '/calendar'
#     expect(page).to have_content'July'
#   end

end