class UsersController < ApplicationController
    get "/login" do
        if session[:user_id]
            erb :"/user/logged_in_home"
        end
        erb :index
    end
    
    post "/login" do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect "/user/logged_in_home"
        else 
          erb :failed_login
        end
    end

    get '/sign-up' do
        if session[:user_id]
            redirect "/users/logged_in_home"
            #cant let current users sign up again if they are in session
        end
        erb :"/new_forms/new_user" #shows form for signing up
    end

    post '/signup' do #uses data from new_user.erb
        @user = User.create(username: params[:username], password: params[:password])
        session[:user_id] = @user.id
        redirect to "/user/logged_in_home" 
    end

    get "/user/logged_in_home" do
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
            erb :"/user/logged_in_home"
        else 
            redirect to "/login"
        end 
    end

    get '/logout' do 
        session.clear
        redirect '/login'
    end

end