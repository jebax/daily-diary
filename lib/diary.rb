require 'pg'

class Diary

  @database = nil

  def self.all_entries
    choose_database
    select_all.map { |entry| entry['title'] }
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
    database.exec('select * from diary')
  end
end
