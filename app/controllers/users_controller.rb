class UsersController < ApplicationController
    get "/login" do
        erb :login
    end
    
    post "/login" do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect "/account"
        else 
          redirect "/failure"
        end
    end

    get '/sign-up' do
        if session[:user_id]
            redirect "/users/#{session[:user_id]}"
            #cant let current users sign up again if they are in session
        end
        erb :"/new_forms/new_user" #shows form for signing up
    end

    post '/signup' do #uses data from new_user.erb
        @user = User.create(username: params[:username], password: params[:password])
        session[:user_id] = @user.id
        redirect to "/user/logged_in_home" 
    end

end