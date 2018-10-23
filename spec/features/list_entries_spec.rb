feature 'listing diary entries' do
  before do
    fill_table_with_two_entries
    visit '/'
    click_button 'View all entries'
  end

  scenario 'button should go to a new page' do
    expect(page).to have_current_path '/all_entries'
  end

  scenario 'should list multiple entries' do
    expect(page).to have_content 'My first entry My second entry'
  end

  scenario 'should be able to return home by clicking on the home button' do
    click_button 'Home'
    expect(page).to have_current_path('/')
  end
end
