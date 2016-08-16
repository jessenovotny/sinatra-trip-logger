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
    #verify logged in user is trip owner
    erb :'trips/edit'
  end

  post '/trip/:trip_id/edit' do
    #update trip
  end

  ### DELETE TRIP ###
  post '/trip/:trip/delete' do
    #verify logged in user is trip owner
    #delete trip
  end

  ### SEARCH BY STATE ###
  post '/trips/by-state' do
    state = State.find(params[:state_id]).slug
    session[:filter_state] = state
    redirect "/trips/by-state/#{state}"
  end

  get '/trips/by-state/:state' do
    @state = State.find_by_slug(params[:state])
    @sports = []
    Trip.all.each do |trip|
      @sports << trip.sport if trip.state == @state
    end
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
    @states = []
    Trip.all.each do |trip|
      @states << trip.state if trip.sport == @sport
    end
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
    erb :'trips/sport_state'
  end












end