feature 'viewing an individual entry' do
  before do
    fill_in_and_submit_entry
    click_button 'View all entries'
    click_button 'My first entry'
  end

  scenario 'can be accessed by clicking on the entry title' do
    expect(page).to have_current_path '/entries/1?id=1'
  end

  scenario 'shows the entry title on screen' do
    expect(page).to have_content 'My first entry'
  end

  scenario 'shows the entry body on screen' do
    expect(page).to have_content 'Lorem ipsum'
  end
end
