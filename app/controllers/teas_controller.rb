class TeasController < ApplicationController
  get '/teas' do
    @teas = Tea.all
    erb :'teas/teas'
  end
end
