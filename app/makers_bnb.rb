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
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
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
    session[:space_id] = params[:space_id]
    @space = Space.find(id: session[:@space_id])
    erb :update_space
  end

  post '/update_space' do
    @space = Space.get(session[:space_id])
    @space.update(name: params[:name],
                description: params[:description],
                price: params[:price],
                street: params[:street],
                city: params[:city])
      if @space.save
      redirect '/your_spaces'
    else
      flash.now[:errors] = "Unable to update page"
       erb :update_space
    end
  end



  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end





  run! if app_file == $0
end
