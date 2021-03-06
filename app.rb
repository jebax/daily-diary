require 'sinatra/base'
require './lib/diary'
require './database_setup'

class DailyDiary < Sinatra::Base
  enable :sessions, :method_override

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

  get '/entries/:id' do
    @entry = Diary.find(params[:id])
    erb :entry
  end

  get '/entries/:id/edit' do
    @entry = Diary.find(params[:id])
    erb :edit
  end

  patch '/entries/:id/edit' do
    Diary.update(params[:id], params[:body])
    session[:id] = params[:id]
    redirect '/entries/:id/edit/complete'
  end

  get '/entries/:id/edit/complete' do
    @entry = Diary.find(session[:id])
    erb :edit_complete
  end

  get '/entries/:id/delete' do
    @entry = Diary.find(params[:id])
    erb :delete_confirm
  end

  delete '/entries/:id/delete' do
    Diary.delete(params[:id])
    redirect '/entries'
  end

  run! if app_file == $PROGRAM_NAME
end
