class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  helper_method :logged_in?, :login, :logout

  ### HOMEPAGE ###
  get '/' do
    erb :index
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