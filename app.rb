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

  get '/entries' do
    @list = Diary.all_entries
    erb :entries
  end

  post '/entries' do
    session[:id] = params[:id]
    redirect '/entry'
  end

  get '/entry' do
    select_entry_from_list
    erb :entry
  end

  post '/entry' do
    session[:id] = params[:id]
    redirect '/entry/edit'
  end

  get '/entry/edit' do
    select_entry_from_list
    erb :edit
  end

  post '/entry/edit' do
    Diary.update(params[:id], params[:body])
    session[:id] = params[:id]
    redirect '/entry/edit/complete'
  end

  get '/entry/edit/complete' do
    select_entry_from_list
    erb :edit_complete
  end

  post '/entry/delete' do
    session[:id] = params[:id]
    redirect '/entry/delete'
  end

  get '/entry/delete' do
    select_entry_from_list
    erb :delete_confirm
  end

  post '/entry/delete/confirm' do
    redirect '/entry' if params[:id] == 'Back'
    Diary.delete(params[:id])
    redirect '/all_entries'
  end

  def select_entry_from_list
    list = Diary.all_entries
    @entry = list.select { |entry| entry.id == session[:id] }.first
  end

  run! if app_file == $PROGRAM_NAME
end
