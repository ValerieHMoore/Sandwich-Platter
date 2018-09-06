class UsersController < ApplicationController

  use Rack::Flash

  get '/users/new' do
    redirect "/users/show" if Helpers.is_logged_in?(session)
    erb :'users/new'
  end
  
  post '/new' do
    redirect "/sandwiches" if Helpers.is_logged_in?(session)
    if params[:username].nil? || params[:username].length <= 0 || params[:email].nil? || params[:email].length <= 0 || params[:password].nil? || params[:password].length <= 0
      redirect '/users/new'
    else
    @user = User.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = @user.id
      redirect '/sandwiches'
    end
  end
  
  get '/login' do
    if Helpers.is_logged_in?(session)
      @user = User.find_by_id(session[:user_id])
      redirect "/users/#{@user.id}"
    else
    erb :"/users/login"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end

  get '/users/:id' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :'/users/show'
    else
      redirect '/login'
    end
  end
    
  get '/logout' do
    session.clear
    redirect '/'
  end

end
