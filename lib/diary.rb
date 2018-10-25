require_relative 'database_manager'

class Diary
  @database = nil

  attr_reader :id, :title, :body

  def self.all_entries
    select_all.map do |entry|
      Diary.new(entry['id'], entry['title'], entry['body'])
    end
  end

  def self.create(title, body)
    DatabaseManager.query('INSERT INTO diary(title,body)' \
    "VALUES('#{title}','#{body}') RETURNING id, title, body")
  end

  def self.update(id, body)
    DatabaseManager.query("UPDATE diary SET body='#{body}' WHERE id='#{id}'" \
    'RETURNING id, title, body')
  end

  def self.delete(id)
    DatabaseManager.query("DELETE FROM diary WHERE id='#{id}'" \
    'RETURNING id, title, body')
  end

  def self.find(id)
    all_entries.select { |entry| entry.id == id }.first
  end

  def initialize(id, title, body)
    @id = id
    @title = title
    @body = body
  end

  def self.select_all
    DatabaseManager.query('SELECT * FROM diary')
  end

  private_class_method :select_all
end
