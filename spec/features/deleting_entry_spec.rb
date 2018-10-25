feature 'deleting an entry' do
  before do
    submit_entry_and_move_to_entry_page
    click_button 'Delete'
  end

  scenario 'should ask for a confirmation when the user presses delete' do
    expect(page).to have_content 'Are you sure you want to delete this entry?'
  end

  scenario 'clicking confirm will take the user back to the list page' do
    click_button 'Confirm'
    expect(page).to have_current_path('/entries')
    expect(page).not_to have_content 'My first entry'
  end

  scenario 'clicking back will take the user back to the entry page' do
    click_button 'Back'
    expect(page).to have_current_path('/entries/1?id=1')
    expect(page).to have_content 'My first entry'
  end
end
