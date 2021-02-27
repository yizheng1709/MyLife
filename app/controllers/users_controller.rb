class UsersController < ApplicationController
    get "/login" do
        if in_session
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

    get '/signup' do
        if in_session
            redirect "/users/logged_in_home"
            #cant let current users sign up again if they are in session
        end
        erb :"/users/new_user" #shows form for signing up
    end

    post '/signup' do #uses data from new_user.erb
        @user = User.create(username: params[:username], password: params[:password])
        @messages = @user.errors.full_messages
        if @user.id
            in_session = @user.id
            redirect to "/users/logged_in_home"
        else 
            @user.errors
            redirect to "/signup"
        end 
    end

    get "/user/logged_in_home" do
        redirect_if_not_logged_in

        if in_session
            @user = current_user
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