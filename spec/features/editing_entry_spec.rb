feature 'editing an entry' do
  before do
    submit_entry_and_move_to_entry_page
    click_button 'Edit'
  end

  scenario "can be initiated by clicking on the 'edit' button" do
    expect(page).to have_current_path '/entry/edit'
  end

  scenario 'shows the title on screen' do
    expect(page).to have_content 'My first entry'
  end

  scenario 'shows the body on screen inside an input form' do
    body = 'Lorem ipsum'
    expect(page).to have_selector("input[type='text'][value='#{body}']")
  end

  scenario 'can click the update button and see a confirmation on screen' do
    fill_in 'body', with: 'Lorem ipsum dolor sit a met'
    click_button 'Update'
    expect(page).to have_content 'Update for My first entry complete'
  end

  scenario 'should show the updated body on screen' do
    updated_body = 'Lorem ipsum dolor sit a met'
    fill_in 'body', with: updated_body
    click_button 'Update'
    expect(page).to have_selector("input[type='text'][value='#{updated_body}']")
  end
end
