class TeasController < ApplicationController
  get '/teas' do
    @user = current_user
    @teas = Tea.all
    erb :'teas/teas'
  end

  get '/teas/new' do
    erb :'teas/create_tea'
  end

  post '/teas/new' do
    @tea = Tea.create(kind: params[:kind], purchase_date: params[:purchase_date], brew_time: params[:brew_time], temperature: params[:temperature], grams: params[:grams], servings: params[:servings], name: params[:name], user_id: current_user.id)
    flash[:message] = "Tea has been added."
    redirect to '/teas/'
  end
end
