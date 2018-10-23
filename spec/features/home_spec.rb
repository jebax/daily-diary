feature "home page" do
  before do
    visit '/'
  end

  scenario "user can see that they are using a diary app" do
    expect(page).to have_content "My Diary"
  end

  scenario "user can fill in a title's entry" do
    expect(page).to have_content "Your entry title:"
    expect(page).to have_css("input[type='text']")
  end
end
