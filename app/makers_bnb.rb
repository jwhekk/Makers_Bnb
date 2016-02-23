ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @user = User.new
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    @user = User.new(first_name: params[:first_name],
                    second_name: params[:second_name],
                    username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    end
      flash.now[:errors] = @user.errors.full_messages
      erb :'/sign_up'
    end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/'
      else
        flash.now[:errors] = ['The email or password is incorrect']
        erb :log_in
      end
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
     @space = Space.new(name: params[:name])
      if
        @space.save
        session[:space] = @space.name
        puts session[:space]
      end
    redirect '/your_spaces'
  end

  get '/your_spaces' do
    @space = session[:space]
    puts @space
    erb :your_spaces
  end

  get '/update_space' do
    erb :update_space
  end

  post '/update_space' do
    redirect '/your_spaces'
  end






  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end





  run! if app_file == $0
end
