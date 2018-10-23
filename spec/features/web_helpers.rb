def fill_in_and_submit_entry
  visit '/'
  fill_in :title, with: "First entry"
  fill_in :body, with: "Lorem ipsum"
  click_button "Submit"
end
