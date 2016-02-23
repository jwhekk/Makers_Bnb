ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    redirect '/'
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
   redirect '/'
  end

  delete '/log_out' do
    redirect '/'
  end

  get '/requests' do
    erb :requests
  end

  get '/calendar' do
   erb :calendar
  end

  get '/space_new' do
    erb :space_new
  end

  post '/space_new' do
     @space = Space.new(name: params[:name],
      description: params[:description],
      price: params[:price],
      street: params[:street],
      city: params[:city])
      if
        @space.save
        redirect '/your_spaces'
      else
        flash.now[:errors] = @space.errors.full_messages
        erb :space_new
    end
  end

  get '/your_spaces' do
    @user_space = Space.all
    erb :your_spaces
  end

  get '/update_space' do
    @space_id = params[:space_id]
    @space = Space.find(id: @space_id)
    puts @space
    erb :update_space
  end

  post '/update_space' do
    redirect '/your_spaces'
  end












  run! if app_file == $0
end