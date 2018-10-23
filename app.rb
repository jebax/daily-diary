require 'sinatra/base'

class DailyDiary < Sinatra::Base
  enable :sessions

  get '/' do
    erb :home
  end

  post '/' do
    session[:title] = params[:title]
    redirect '/submit'
  end

  get '/submit' do
    @title = session[:title]
    erb :submit
  end

  get '/all_entries' do
    erb :all_entries
  end

  run! if app_file == $0
end
