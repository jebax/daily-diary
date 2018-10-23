feature "listing diary entries" do
  before do
    fill_in_and_submit_two_entries
    click_button "View all entries"
  end

  scenario "button should go to a new page" do
    expect(page).to have_current_path "/all_entries"
  end

  scenario "should list multiple entries" do
    expect(page).to have_content "My first entry My second entry"
  end
end
