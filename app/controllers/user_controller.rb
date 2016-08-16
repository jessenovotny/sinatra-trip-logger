class UserController < ApplicationController

  ### LOGIN ###
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/'
    end
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
    if !params[:user][:username].empty? && !params[:user][:email].empty? && !params[:user][:password].empty?
      user = User.create(params[:user])
      login(params[:user][:username], params[:user][:password])
      flash[:message] = "Account successfully created"
      redirect "/"
    else
      flash[:message] = "Please enter a valid username, email, and password."
      redirect "/signup"
    end
  end

  ### LOGOUT ###
  get '/logout' do
    logout if logged_in?
    redirect '/'
  end

  ### USER'S POSTS ###
  get '/user/:user_slug' do
    @user = User.find_by_slug(params[:user_slug])
    @trips = @user.trips
    erb :'users/show'
  end

end