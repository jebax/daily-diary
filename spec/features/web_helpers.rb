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
  database.exec('DROP TABLE IF EXISTS diary')
  database.exec('CREATE TABLE diary(id SERIAL PRIMARY KEY, title VARCHAR(60)' \
    ', body VARCHAR(2000))')
end

def fill_table_with_two_entries
  database.exec("INSERT INTO diary(title,body) " \
    "VALUES('My first entry','Lorem ipsum'), ('My second entry','Lorem ipsum')")
end
