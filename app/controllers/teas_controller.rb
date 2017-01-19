class TeasController < ApplicationController
  get '/teas' do
    @user = current_user
    @teas = Tea.all
    erb :'teas/teas'
  end
end
