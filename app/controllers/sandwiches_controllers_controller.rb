class SandwichesControllersController < ApplicationController

  # GET: /sandwiches_controllers
  get "/sandwiches_controllers" do
    erb :"/sandwiches_controllers/index.html"
  end

  # GET: /sandwiches_controllers/new
  get "/sandwiches_controllers/new" do
    erb :"/sandwiches_controllers/new.html"
  end

  # POST: /sandwiches_controllers
  post "/sandwiches_controllers" do
    redirect "/sandwiches_controllers"
  end

  # GET: /sandwiches_controllers/5
  get "/sandwiches_controllers/:id" do
    erb :"/sandwiches_controllers/show.html"
  end

  # GET: /sandwiches_controllers/5/edit
  get "/sandwiches_controllers/:id/edit" do
    erb :"/sandwiches_controllers/edit.html"
  end

  # PATCH: /sandwiches_controllers/5
  patch "/sandwiches_controllers/:id" do
    redirect "/sandwiches_controllers/:id"
  end

  # DELETE: /sandwiches_controllers/5/delete
  delete "/sandwiches_controllers/:id/delete" do
    redirect "/sandwiches_controllers"
  end
end
