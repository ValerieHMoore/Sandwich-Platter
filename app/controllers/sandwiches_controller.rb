class SandwichesController < ApplicationController

  # GET: /sandwiches
  get "/sandwiches" do
    erb :"/sandwiches/index.html"
  end

  # GET: /sandwiches/new
  get "/sandwiches/new" do
    erb :"/sandwiches/new.html"
  end

  # POST: /sandwiches
  post "/sandwiches" do
    redirect "/sandwiches"
  end

  # GET: /sandwiches/5
  get "/sandwiches/:id" do
    erb :"/sandwiches/show.html"
  end

  # GET: /sandwiches/5/edit
  get "/sandwiches/:id/edit" do
    erb :"/sandwiches/edit.html"
  end

  # PATCH: /sandwiches/5
  patch "/sandwiches/:id" do
    redirect "/sandwiches/:id"
  end

  # DELETE: /sandwiches/5/delete
  delete "/sandwiches/:id/delete" do
    redirect "/sandwiches"
  end
end
