class TeasController < ApplicationController
  get '/teas' do
    if logged_in?
      @user = current_user
      @teas = Tea.all
      erb :'teas/teas'
    else
      redirect to "/login"
    end
  end

  get '/teas/new' do
    if logged_in?
      erb :'teas/create_tea'
    else
      redirect to "/login"
    end
  end

  post '/teas/new' do
    @tea = Tea.create(kind: params[:kind], purchase_date: params[:purchase_date], brew_time: params[:brew_time], temperature: params[:temperature], grams: params[:grams], servings: params[:servings], name: params[:name], user_id: current_user.id)
    flash[:message] = "Tea has been added."
    redirect to '/teas'
  end

  get '/teas/:id' do
    if logged_in?
      @user = current_user
      @tea = Tea.find_by_id(params[:id])
      erb :'teas/show_tea'
    else
      redirect to "/login"
    end
  end

  get '/teas/:id/edit' do
    if logged_in?
      @user = current_user
      @tea = Tea.find_by_id(params[:id])
      if @tea.user_id == current_user.id
        erb :'teas/edit_tea'
      else
        redirect to "/tea"
      end
    else
      redirect to "/login"
    end
  end
end
