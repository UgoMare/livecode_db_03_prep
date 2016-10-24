require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

#index
get "/" do
  @restaurants = Restaurant.all.order(votes: :desc).limit(10)
  erb :index
end

#new
get "/restaurants/new" do
  erb :new
end

#show
get "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

#create
post "/restaurants" do
  restaurant = Restaurant.new(name: params[:name], address: params[:address])
  restaurant.save

  redirect to("/restaurants/#{restaurant.id}")
end

#upvote
get "/restaurants/:id/upvote" do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.votes += 1
  @restaurant.save
  redirect to("/")
end

#destroy
get "/restaurants/:id/destroy" do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.destroy
  redirect to("/")
end

#edit
#update



