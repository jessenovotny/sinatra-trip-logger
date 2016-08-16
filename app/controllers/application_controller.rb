class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    use Rack::Flash
  end

  ### HOMEPAGE ###
  get '/' do
    @trips = Trip.all.reverse
    @states = []
    @sports = []
    @trips.each do |trip|
      @states << trip.state
      @sports << trip.sport
    end
    @states.uniq!
    @sports.uniq!
    erb :index
  end

  helpers do
    def current_user
      session[:user_id].nil? ? nil : User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def login username, password
      user = User.find_by(username: username)
      if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect '/'
      else
        flash[:message] = "Username or password not found. Please try again."
        redirect '/login'
      end
    end

    def logout
      session.clear
    end
  end
end