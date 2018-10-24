feature 'submitting entries' do
  before do
    fill_in_and_submit_entry
  end

  scenario 'submitting an entry shows a confirmation on screen' do
    expect(page).to have_content 'My first entry entered into your diary.'
  end

  scenario 'submitting an entry takes the user to a different page' do
    expect(page).to have_current_path '/submit'
  end

  scenario 'should not let the user submit without both title and body' do
    error_message = 'Please enter a title and body before submitting!'
    click_button 'Submit'
    expect(page).to have_content error_message
  end
end
