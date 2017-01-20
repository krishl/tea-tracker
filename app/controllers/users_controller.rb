class UsersController < ApplicationController
  get '/users/new' do
    if logged_in?
      flash[:message] = "You are already logged in."
      redirect to "/teas"
    else
      erb :'users/create_user'
    end
  end

  get '/login' do
    if logged_in?
      flash[:message] = "You are already logged in."
      redirect to "/teas"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      flash[:message] = "Successfully logged in."
      redirect to "/teas"
    else
      flash[:message] = "Please double-check your login information!"
      redirect to "/login"
    end
  end

  post '/users' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    if @user.valid?
      session[:id] = @user.id
      flash[:message] = "Sign up successful!"
      redirect to "/teas"
    else
      flash[:message] = "Please complete the form!"
      redirect to "/users/new"
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
      redirect to "/"
    end
  end
end
