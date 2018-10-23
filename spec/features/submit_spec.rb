feature "submitting entries" do
  before do
    visit '/'
    fill_in :title, with: "First entry"
    fill_in :body, with: "Lorem ipsum"
    click_button "Submit"
  end

  scenario "submitting an entry shows a confirmation on screen" do
    expect(page).to have_content "First entry entered into your diary."
  end

  scenario "submitting an entry takes the user to a different page" do
    expect(page).to have_current_path '/submit'
  end
end
