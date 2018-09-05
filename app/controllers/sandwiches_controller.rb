require 'rack-flash'

class SandwichesController < ApplicationController

  use Rack::Flash

  #Get all sandwiches
  get '/sandwiches' do
    @sandwiches = Sandwich.all
    erb :'/sandwiches/index'
  end

  #Get form to Create a New Sandwich - must be logged in to do so
  get '/sandwiches/new' do
    if Helpers.is_logged_in?(session)
    @user = Helpers.current_user(session)
      erb :'/sandwiches/new'
    else
      redirect '/login'
    end
  end

  #Post/Create a New Sandwich
  post '/sandwiches' do
    if Helpers.is_logged_in?(session) && params[:sandwich_name] != ""
        @user = Helpers.current_user(session)
        #Associated Build
        @user.sandwiches.create(:sandwich_name => params[:sandwich_name], :ingredients => params[:ingredients])
        flash[:message] = "Sandwich created."
        redirect "/users/#{@user.id}"
    elsif params[:sandwich_name]
        redirect '/sandwiches/new'
    else
        redirect '/login'
    end
  end

  # GET: /sandwiches/5
  get "/sandwiches/:id" do
    @sandwich = Sandwich.find_by_id(params[:id])
      erb :'sandwiches/show'
  end

  # GET: /sandwiches/5/edit
  get "/sandwiches/:id/edit" do
    if Helpers.is_logged_in?(session)
      @sandwich = Sandwich.find_by_id(params[:id])
      erb :'sandwiches/edit'
      else
      redirect '/login'
      end
  end

  # PATCH: /sandwiches/5
  patch '/sandwiches/:id' do
    @sandwich = Sandwich.find_by_id(params[:id])
    if params[:sandwich_name] != ""
        @sandwich.update(:sandwich_name => params[:sandwich_name], :ingredients => params[:ingredients])
        @sandwich.save
        redirect "/sandwiches/#{@sandwich.id}"
    else
        redirect "/sandwiches/#{@sandwich.id}/edit"
    end
  end

  # DELETE: /sandwiches/5/delete
  delete '/sandwiches/:id' do
    if Helpers.is_logged_in?(session)
        @sandwich = Sandwich.find(params[:id])
        @user = Helpers.current_user(session)
        if @sandwich.user == @user
          @sandwich.destroy
          flash[:message] = "Sandwich deleted."
          redirect "/users/#{@user.id}"
        else
          redirect '/sandwiches'
        end
    else
        redirect '/login'
      end
    end
end
