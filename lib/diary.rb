require 'pg'

class Diary
  @database = nil

  attr_reader :id, :title, :body

  def self.all_entries
    choose_database
    select_all.map do |entry|
      Diary.new(entry['id'], entry['title'], entry['body'])
    end
  end

  def self.create(title, body)
    choose_database
    @database.exec("INSERT INTO diary(title,body)" \
    "VALUES('#{title}','#{body}') RETURNING id, title, body")
  end

  def self.update(id, body)
    choose_database
    @database.exec("UPDATE diary SET body='#{body}' WHERE id='#{id}'" \
    "RETURNING id, title, body")
  end

  def self.delete(id)
    choose_database
    @database.exec("DELETE FROM diary WHERE id='#{id}'" \
    "RETURNING id, title, body")
  end

  def initialize(id, title, body)
    @id = id
    @title = title
    @body = body
  end

  private

  def self.choose_database
    if ENV['ENVIRONMENT'] == 'test'
      @database = PG.connect(dbname: 'daily_diary_test')
    else
      @database = PG.connect(dbname: 'daily_diary')
    end
  end

  def self.select_all
    @database.exec('SELECT * FROM diary')
  end
end
