feature "index page" do
  scenario "user can see that they are using a diary app" do
    visit '/'
    expect(page).to have_content "My Diary"
  end
end
