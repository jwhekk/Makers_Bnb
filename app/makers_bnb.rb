ENV['RACK_ENV'] ||= 'development'

require_relative 'requirements'
require_relative 'controllers/messenger'


class MakersBnB < Sinatra::Base
  include Calendar_helpers
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
    @calendar = prepare_calendar("2016-03-01", @space)
    erb :making_a_request

  end

  post '/making_a_request' do
    @current_user = current_user
    @space = Space.get(params[:space_id])
    @booking = Booking.new(start_date: params[:Start_date],
                           end_date: params[:End_date],
                           message: params[:Message],
                           guest_number: params[:Guest_number],
                           space: @space,
                           confirmed: 'unconfirmed',
                           user: @current_user)
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
    create_calendar
    @calendar = prepare_calendar("2016-03-01", Space.get(1) )
   erb :space_calendar
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
                        host_email: @current_user.email,
                        )

     @space.space_calendars << create_calendar
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
    redirect '/your_spaces'
  end

  post '/update_confirmation' do
    @booking = Booking.get(params[:booking_id])
    @space = @booking.space.name
    @messenger=Messenger.new

    if params[:confirmation_status] == 'Confirm'
      @booking.update(confirmed: 'confirmed')
      @messenger.send_booking_confirmation_text(@space)

    else
      @booking.update(confirmed: 'denied')
      @messenger.send_request_denied_text(@space)
    end
    redirect('/your_hosting_requests')
  end

  post '/delete_request' do
    @booking = Booking.get(params[:booking_id])
    @booking.destroy
    redirect '/your_requests'
  end

  get '/more_info' do
    if !session[:calendar]
      session[:date] = Date.today.to_s[0,7] + '-01'
      @calendar = prepare_calendar(session[:date], Space.get(1) )
    else
      @calendar = session[:calendar]
    end
    erb :more_info
  end

  post '/more_info' do
    @space = Space.get(1)
    if params[:pressed] == 'next'
      session[:calendar] = prepare_next(session[:date], @space)
      session[:date]= Date.parse(session[:date]).next_month.to_s[0,10]
    else
      session[:calendar] = prepare_previous(session[:date], @space)
      session[:date]= Date.parse(session[:date]).prev_month.to_s[0,10]
    end
    redirect '/more_info'
  end


  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end

  run! if app_file == $0
end
