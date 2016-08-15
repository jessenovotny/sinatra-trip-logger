class UserController < ApplicationController

  ### LOGIN ###
  get '/login' do
    erb :login
  end

  post '/login' do
    if !params[:username].empty? && !params[:password].empty?
      login(params[:username], params[:password])
    else
      flash[:message] = "Please enter a valid username and password."
      redirect '/login'
    end
  end

  ### SIGN UP ###
  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    else
      redirect "/"
    end
  end

  post '/signup' do
    #create new user
  end

  ### LOGOUT ###
  get '/logout' do
    logout
    redirect '/'
  end

  ### USER'S POSTS ###
  get 'user/:user_slug'
    @user = User.find_by_slug(params[:user_slug])
    erb :'user/show'
  end

end