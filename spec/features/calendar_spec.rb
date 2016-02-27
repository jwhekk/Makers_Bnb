feature 'calendar' do

  let!(:space_calendar) do
    SpaceCalendar.create(year: '2016',
                          availability: statuses)
  end

  scenario 'shows the availability of the space' do
    visit '/calendar'
    expect(page).to have_content'February'
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
