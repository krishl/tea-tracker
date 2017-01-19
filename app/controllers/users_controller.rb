class UsersController < ApplicationController
  get '/signup' do
    redirect to "/teas" if logged_in?
    erb :'users/create_user'
  end

  get '/login' do
    redirect to "/teas" if logged_in?
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect to "/teas"
    else
      flash[:message] = "Please double-check your login information!"
      redirect to "/login"
    end
  end

  post '/signup' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if @user.valid?
      session[:id] = @user.id
      flash[:message] = "Sign up successful!"
      redirect to "/teas"
    else
      flash[:message] = "Please complete the form!"
      redirect to "/signup"
    end
  end

  get '/users/:id' do
    if logged_in?
      @user = User.find_by_id(params[:id])
      if @user
        erb :'users/show'
      else
        redirect to "/teas"
      end
    else
      redirect to '/'
    end
  end
end
