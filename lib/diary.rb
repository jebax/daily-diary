require 'pg'

class Diary
  def self.all_entries
    if ENV['ENVIRONMENT'] = 'test'
      database = PG.connect(dbname: 'daily_diary_test')
    else
      database = PG.connect(dbname: 'daily_diary')
    end
    all = database.exec('select * from diary')
    all.map { |entry| entry['title'] }
  end
end
