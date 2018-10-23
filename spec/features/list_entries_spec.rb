feature "listing diary entries" do
  scenario "home page should have a button to view entries" do
    visit '/'
    expect(page).to have_selector("input[type='submit'][value='View all entries']")
  end
end
