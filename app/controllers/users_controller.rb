class UsersController < ApplicationController
  get '/users/new' do   # redirects to teas page if user is already logged in
    if !!current_user
      flash[:message] = "You are already logged in."
      redirect to "/teas"
    else
      erb :'users/create_user'
    end
  end

  get '/login' do   # redirects to teas page if user is already logged in
    if !!current_user
      flash[:message] = "You are already logged in."
      redirect to "/teas"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])   # finds user by username param
    if @user && @user.authenticate(params[:password])   # checks if login info is valid
      session[:user_id] = @user.id
      flash[:message] = "Successfully logged in."
      redirect to "/teas"
    else
      flash[:message] = "Please double-check your login information!"
      redirect to "/login"
    end
  end

  post '/users' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])   # creates new user
    if @user.save    # attempt to save new user
      session[:user_id] = @user.id
      flash[:message] = "Sign up successful!"
      redirect to "/teas"
    else    # executes if new user does not pass validations
      flash[:message] = "Please complete the form!"
      redirect to "/users/new"
    end
  end

  get '/users/:id' do
    if logged_in?
      @user = User.find_by_id(params[:id])
      if @user
        @users_teas = @user.teas
        erb :'users/show'
      else
        redirect to "/teas"
      end
    else
      redirect to "/"
    end
  end

  get '/logout' do
    session.clear
    flash[:message] = "Successfully logged out."
    redirect to "/"
  end
end
