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
  post '/trip/:trip_id/delete' do
    #verify logged in user is trip owner
    #delete trip
  end

end