require './lib/database_manager'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseManager.setup('daily_diary_test')
else
  DatabaseManager.setup('daily_diary')
end
