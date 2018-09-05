class UsersController < ApplicationController

  use Rack::Flash

  # GET: /users/new
  get '/users/new' do
    redirect "/users/show" if Helpers.is_logged_in?(session)
    erb :'users/new'
  end
  
  # POST: /users
  post '/new' do
    redirect "/sandwiches" if Helpers.is_logged_in?(session)
    @user = User.create(:username => params[:username], :password => params[:password], :email => params[:email])
    if params[:username].nil? || params[:username].length <= 0 || params[:email].nil? || params[:email].length <= 0 || params[:password].nil? || params[:password].length <= 0
      redirect '/new'
    else
      session[:user_id] = @user.id
      redirect '/sandwiches'
    end
  end
  
  get '/login' do
    redirect "/users/show" if Helpers.is_logged_in?(session)    
    erb :"/users/login"
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      redirect '/users/show'
    else
      redirect '/login'
    end
  end

  # GET: /users/show
  get '/users/:id' do
    if Helpers.is_logged_in?(session)
      @user = User.find_by_id(params[:id])
      @current_user = Helpers.current_user(session)
      #if @sandwich.user == current_user
       # @sandwiches = User.sandwiches
        erb :'/users/show'
    else
      redirect '/login'
      #end
    end
  end
    
  get '/logout' do
    session.clear
    flash[:message] = "You are logged out."
    redirect '/login'
  end

end
