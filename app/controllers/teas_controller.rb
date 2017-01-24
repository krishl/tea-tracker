class TeasController < ApplicationController
  get '/teas' do
    if logged_in?
      @teas = Tea.all
      erb :'teas/teas'
    end
  end

  get '/teas/new' do
    if logged_in?
      erb :'teas/create_tea'
    end
  end

  post '/teas' do
    if logged_in?
      @tea = current_user.teas.build(tea_params)
      if @tea.save
        flash[:message] = "Tea has been added."
        redirect to "users/#{current_user.id}"
      else
        flash[:message] = "'Name' field is required."
        redirect to '/teas/new'
      end
    end
  end

  get '/teas/:id' do
    if logged_in?
      @tea = Tea.find_by_id(params[:id])
      erb :'teas/show_tea'
    end
  end

  get '/teas/:id/edit' do
    if logged_in?
      @tea = Tea.find_by_id(params[:id])
      if @tea.user_id == current_user.id
        erb :'teas/edit_tea'
      else
        flash[:message] = "Cannot edit another user's tea entry."
        redirect to "/teas"
      end
    end
  end

  patch '/teas/:id' do
    @tea = Tea.find_by_id(params[:id])
    @tea.update(tea_params)
    flash[:message] = "Successfully edited tea entry!"
    redirect to "/teas/#{@tea.id}"
  end

  delete '/teas/:id/delete' do
    if logged_in?
      @tea = Tea.find_by_id(params[:id])
      if @tea.user == current_user
        @tea.destroy
        flash[:message] = "Successfully deleted tea entry!"
        redirect to "/teas"
      else
        flash[:message] = "Cannot delete another user's tea entry."
        redirect to "/teas"
      end
    end
  end

  private

    def tea_params
      {
        kind: params[:kind],
        purchase_date: params[:purchase_date],
        brew_time: params[:brew_time],
        temperature: params[:temperature],
        grams: params[:grams],
        servings: params[:servings],
        name: params[:name]
      }
    end
end
