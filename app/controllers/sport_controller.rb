class SportController < ApplicationController

  ### ALL SPORTS ###
  get '/sports' do
    erb :'sports/all'
  end

  ### all trips for a given sport
  get '/trips/sports/:sport_id' do
    erb :'sports/show_trips'
  end

  ### all states for a given sport
  get '/states/sports/:sport_id' do
    erb :'sports/show_states'
  end

  ### all users in a given sport
  get '/users/sports/:sport_id' do
    erb :'sports/show_users'
  end

end