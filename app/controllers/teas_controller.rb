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
      @user = current_user
      erb :'teas/create_tea'
    else
      redirect to "/login"
    end
  end

  post '/teas' do
    if logged_in?
      @tea = current_user.teas.build(kind: params[:kind], purchase_date: params[:purchase_date], brew_time: params[:brew_time], temperature: params[:temperature], grams: params[:grams], servings: params[:servings], name: params[:name], user_id: current_user.id)
      if @tea.save
        flash[:message] = "Tea has been added."
        redirect to "users/#{current_user.id}"
      else
        redirect to '/teas/new'
      end
    else
      redirect to "/login"
    end
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

  patch '/teas/:id' do
    @tea = Tea.find_by_id(params[:id])
    @tea.update(kind: params[:kind], purchase_date: params[:purchase_date], brew_time: params[:brew_time], temperature: params[:temperature], grams: params[:grams], servings: params[:servings], name: params[:name])
    redirect to "/teas/#{@tea.id}"
  end

  delete '/teas/:id/delete' do
    if logged_in?
      @tea = Tea.find_by_id(params[:id])
      if @tea.user_id == current_user.id
        @tea.destroy
        flash[:message] = "Successfully deleted tea entry!"
        redirect to "/teas"
      else
        flash[:message] = "Cannot delete another user's tea entry."
        redirect to "/teas"
      end
    else
      flash[:message] = "You are not logged in."
      redirect to "/login"
    end
  end
end
