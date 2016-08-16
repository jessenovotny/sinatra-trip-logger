class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  ### HOMEPAGE ###
  get '/' do
    @trips = Trip.all
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

  ### SEARCH ###
  post '/trips/by-state' do
    state = State.find(params[:state_id]).slug
    session[:filter_state] = state
    redirect "/trips/by-state/#{state}"
  end

  post '/trips/by-sport' do
    sport = Sport.find(params[:sport_id]).slug
    session[:filter_sport] = sport
    redirect "/trips/by-sport/#{sport}"
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
        session[:user_id] = user.username
      else
        #create flash message
        redirect '/login'
      end
    end

    def logout
      session.clear
    end
  end
end