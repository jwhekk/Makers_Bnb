ENV['RACK_ENV'] ||= 'development'

require_relative 'requirements'


class MakersBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @user = User.new
    @spaces = Space.all
    @current_user = current_user
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
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye.'
    redirect '/'
  end

  get '/making_a_request' do
    @space = params[:space_id]
    @space = Space.get(@space)
    erb :making_a_request
  end

  post '/making_a_request' do
    @current_user = current_user
    @space = Space.get(params[:space_id])
    @booking = Booking.new(start_date: params[:Start_date],
                           end_date: params[:End_date],
                           message: params[:Message],
                           guest_number: params[:Guest_number],
                           space: @space)
    if @booking.save
        @current_user.bookings << @booking
        @space.bookings << @booking
        @current_user.save
        @space.save
        redirect '/your_requests'
    else
      flash.now[:errors] = @booking.errors.full_messages
      erb :making_a_request
    end
  end

  get '/your_hosting_requests' do
    @current_user = current_user

    erb :your_hosting_requests
  end

  get '/your_requests' do
    @current_user = current_user
    @space = Space.get(params[:space_id])
    erb :your_requests
  end

  get '/calendar' do
   erb :calendar
  end

  get '/space_new' do
    @current_user = current_user
    erb :space_new
  end

  post '/space_new' do
     @current_user = current_user
     @space = Space.new(name: params[:name],
                        description: params[:description],
                        price: params[:price],
                        street: params[:street],
                        city: params[:city],
                        host_email: @current_user.email)

      if
        @space.save
        @current_user.spaces << @space
        @current_user.save
         session[:new_space_id] = @space.id
        redirect '/your_spaces'

      else
        flash.now[:errors] = @space.errors.full_messages
        erb :space_new
    end
  end

  get '/your_spaces' do
    @current_user = current_user
    @user_space = Space.all(:host_email => @current_user.email)
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

  post '/update_availability' do
    #calendar = params[:availabilty], params[:start_date], params[:end_date]
    redirect '/your_spaces'
  end

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  run! if app_file == $0
end
