require 'pg'

class Diary
  @database = nil

  def self.all_entries
    choose_database
    select_all.map { |entry| entry['title'] }
  end

  def self.create(title, body)
    choose_database
    database.exec("INSERT INTO diary(title,body) VALUES('#{title}','#{body}')")
  end

  private

  attr_reader :database

  def self.choose_database
    if ENV['ENVIRONMENT'] = 'test'
      database = PG.connect(dbname: 'daily_diary_test')
    else
      database = PG.connect(dbname: 'daily_diary')
    end
  end

  def self.select_all
    database.exec('SELECT * FROM diary')
  end
end
