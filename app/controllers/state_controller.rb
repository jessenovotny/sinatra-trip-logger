class StateController < ApplicationController

  ### ALL STATES ###
  get '/states' do
    erb :'states/all'
  end

  ### all trips for a given state
  get '/trips/states/:state_slug' do
    erb :'states/show_trips'
  end

  ### all sports for a given state
  get '/sports/states/:state_slug' do
    erb :'states/show_sports'
  end

  ### all users in a given state
  get '/users/states/:state_slug' do
    erb :'states/show_users'
  end

end