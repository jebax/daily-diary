feature "home page" do
  before do
    visit '/'
  end

  scenario "user can see that they are using a diary app" do
    expect(page).to have_content "My Diary"
  end

  scenario "user can fill in an entry's title and body" do
    expect(page).to have_content "Your entry title:"
    expect(page).to have_content "Your entry body:"
    expect(page).to have_css("input[type='text']")
  end

  scenario "user can submit an entry" do
    expect(page).to have_selector("input[type='submit'][value='Submit']")
  end

  scenario "home page should have a button to view entries" do
    expect(page).to have_selector("input[type='submit'][value='View all entries']")
  end
end
