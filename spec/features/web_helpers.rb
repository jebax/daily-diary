def fill_in_and_submit_entry
  visit '/'
  fill_in :title, with: "My first entry"
  fill_in :body, with: "Lorem ipsum"
  click_button "Submit"
end

def fill_in_and_submit_two_entries
  fill_in_and_submit_entry
  fill_in :title, with: "My second entry"
  fill_in :body, with: "Lorem ipsum"
  click_button "Submit"
end
