class UsersController < ApplicationController
    get "/login" do
        if session[:user_id]
            erb :"/users/logged_in_home"
        end
        erb :index
    end
    
    post "/login" do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect "/users/logged_in_home"
        else 
          erb :failed_login
        end
    end

    get '/signup' do
        if session[:user_id]
            redirect "/users/logged_in_home"
        end
        erb :"/users/new_user" 
    end

    post '/signup' do 
        @user = User.create(username: params[:username], password: params[:password])
        @messages = @user.errors.full_messages

        if @user.id && @messages.empty?
            session[:user_id] = @user.id
            redirect to "/users/logged_in_home"
        else 
            erb :"users/new_user"
        end 
    end

    get "/users/logged_in_home" do
        redirect_if_not_logged_in

        if session[:user_id]
            @user = current_user
            erb :"/users/logged_in_home"
        else 
            redirect to "/login"
        end 
    end

    get '/logout' do 
        session.clear
        redirect '/login'
    end

end