class TeasController < ApplicationController
  get '/teas' do
    @user = current_user
    @teas = Tea.all
    erb :'teas/teas'
  end

  get '/teas/new' do
    erb :'teas/create_tea'
  end
end
