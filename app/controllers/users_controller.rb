class UsersController < ApplicationController
  get '/signup' do
    erb :'users/create_user'
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if @user.valid?
      session[:id] = @user.id
      flash[:message] = "Sign up successful!"
      redirect to "teas/teas"
    else
      flash[:message] = "Please complete the form!"
      redirect to "/signup"
    end
  end
end
