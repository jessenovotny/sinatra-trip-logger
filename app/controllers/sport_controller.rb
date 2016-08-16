class SportController < ApplicationController

  ### ALL SPORTS ###
  get '/sports' do
    @sports = Sport.all
    erb :'sports/all'
  end

  ### all trips for a given sport
  get '/sport/trip/:sport_slug' do
    @sport = Sport.find_by_slug(params[:sport_slug])
    @trips = @sport.trips
    erb :'sports/show_trips'
  end

  ### all states for a given sport
  get '/sports/states/:sport_slug' do
    @sport = Sport.find_by_slug(params[:sport_slug])
    @states = @sport.states
    erb :'sports/show_states'
  end

  ### all users in a g iven sport
  get '/sports/users/:sport_slug' do
    @sport = Sport.find_by_slug(params[:sport_slug])
    @users = @sport.users
    erb :'sports/show_users'
  end

end