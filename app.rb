require 'sinatra/base'
require './lib/diary'

class DailyDiary < Sinatra::Base
  enable :sessions

  get '/' do
    erb :home
  end

  post '/' do
    redirect '/invalid_entry' if params[:title].empty? || params[:body].empty?
    Diary.create(params[:title], params[:body])
    session[:title] = params[:title]
    redirect '/submit'
  end

  get '/invalid_entry' do
    erb :invalid_entry
  end

  get '/submit' do
    @title = session[:title]
    erb :submit
  end

  get '/all_entries' do
    @list = Diary.all_entries
    erb :all_entries
  end

  post '/all_entries' do
    session[:id] = params[:id]
    redirect '/entry'
  end

  get '/entry' do
    list = Diary.all_entries
    @entry = list.select { |entry| entry.id == session[:id] }.first
    erb :entry
  end

  run! if app_file == $PROGRAM_NAME
end
