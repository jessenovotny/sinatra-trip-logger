class TripController < ApplicationController



  ### LOG NEW TRIP ###
  get '/trip/new' do
    if logged_in?
      @user = current_user
      @sports = Sport.all
      @states = State.all
      erb :'trips/new'
    else
      redirect '/login'
    end
  end

  post '/trip/new' do
    if params[:trip][:about].empty? && params[:sport_name].empty? && params[:new_sport].empty?
      redirect '/trip/new'
    else
      @trip = Trip.create(params[:trip])
      if params[:sport_name].empty?
        @trip.sport_id = Sport.find_or_create_by(name: params[:new_sport]).id
      else
        @trip.sport_id = Sport.find_by(name: params[:sport_name]).id
      end
      @trip.save
      redirect '/'
    end
  end



  ### EDIT TRIP ###
  get '/trip/:trip_id/edit' do
    @trip = Trip.find(params[:trip_id])
    if @trip.user == current_user
      @user = current_user
      @sports = Sport.all
      @states = State.all
      erb :'trips/edit'
    else
      redirect '/'
    end
  end

  post '/trip/:trip_id/edit' do
    if params[:trip][:about].empty? && params[:sport_name].empty? && params[:new_sport].empty?
      redirect "/trip/#{params[:trip_id]}/edit"
    else 
      @trip = Trip.find(params[:trip_id])
      @trip.state_id = params[:trip][:state_id]
      if params[:sport_name].empty?
        @trip.sport_id = Sport.find_or_create_by(name: params[:new_sport]).id
      else
        @trip.sport_id = Sport.find_by(name: params[:sport_name]).id
      end
      @trip.save
      redirect '/'
    end
  end

  ### DELETE TRIP ###
  delete '/trip/:trip_id/delete' do
    trip = Trip.find(params[:trip_id])
    if trip.user == current_user
      trip.delete 
      redirect "/user/#{current_user.slug}"
    else
      redirect "/user/#{current_user.slug}"
    end
  end

  ### SEARCH BY STATE ###
  post '/trips/by-state' do
    state = State.find(params[:state_id]).slug
    session[:filter_state] = state
    redirect "/trips/by-state/#{state}"
  end

  get '/trips/by-state/:state' do
    @state = State.find_by_slug(params[:state])

    @trips = Array.new(Trip.where('state_id = ?', @state.id))
    @sports = []
    @trips.map{|trip| @sports << trip.sport if trip.state == @state}
    @sports.uniq!
    erb :'trips/by_state'
  end

  ### SEARCH BY SPORT ###
  post '/trips/by-sport' do
    sport = Sport.find(params[:sport_id]).slug
    session[:filter_sport] = sport
    redirect "/trips/by-sport/#{sport}"
  end

  get '/trips/by-sport/:sport' do
    @sport = Sport.find_by_slug(params[:sport])
    @trips = []
    @trips << Trip.where('sport_id = ?', @sport.id)
    @trips.flatten!
    @states = []
    @trips.each{|trip| @states << trip.state if trip.sport == @sport}
    @states.uniq!
    erb :'/trips/by_sport'
  end


  ### SEARCH BY STATE AND SPORT ###
  post '/trips/:state/sport' do
    sport = Sport.find(params[:sport_id])
    state = State.find_by_slug(params[:state])
    redirect "/trips/#{sport.slug}/#{state.slug}"
  end

  post '/trips/:sport/state' do
    sport = Sport.find_by_slug(params[:sport])
    state = State.find(params[:state_id])
    redirect "/trips/#{sport.slug}/#{state.slug}"
  end

  get '/trips/:sport/:state' do
    @sport = Sport.find_by_slug(params[:sport])
    @state = State.find_by_slug(params[:state])
    @trips = []
    @trips << Trip.where('sport_id = ? AND state_id = ?', @sport.id, @state.id)
    @trips.flatten!
    erb :'trips/sport_state'
  end












end