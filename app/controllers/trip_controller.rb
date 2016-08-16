class TripController < ApplicationController



  ### LOG NEW TRIP ###
  get '/trip/new' do
    erb :'trips/new'
  end

  post '/trip/new' do
    #verify logged in, otherwise prompt to login or signup. 
    #create new trip
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

  get '/trip/all_states/:sport' do
    # SHOW ALL TRIPS PER GIVEN SPORT
  end

  get '/trip/all_sports/:state' do
    # SHOW ALL TRIPS PER GIVEN STATE
  end

  get '/trip/:sport_id/:state' do
    # ALL TRIPS PER GIVEN SPORT AND STATE
  end

  get '/trips/by-state/:state' do
    @state = State.find_by_slug(params[:state])
    binding.pry
    erb :'trips'
  end

  get '/trips/by-sport/:sport' do
    @sport = Sport.find_by_slug(params[:sport])
    binding.pry
    erb :'/trips/by_sport'
  end











end