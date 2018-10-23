def fill_in_and_submit_entry
  visit '/'
  fill_in :title, with: 'My first entry'
  fill_in :body, with: 'Lorem ipsum'
  click_button 'Submit'
end

def fill_in_and_submit_two_entries
  fill_in_and_submit_entry
  fill_in :title, with: 'My second entry'
  fill_in :body, with: 'Lorem ipsum'
  click_button 'Submit'
end

def database
  PG.connect(dbname: 'daily_diary_test')
end

def empty_table
  database.exec('TRUNCATE TABLE diary')
end
