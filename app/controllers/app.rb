class ApplicationController < Sinatra::Base 

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, 'secret'
    end

    get '/' do
        erb :index
    end

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

    #show all entries
    #add button to lead to adding new entry
    get '/entries' do
        user = User.find_by(id: session[:user_id]) 
        @entries = user.entries.order(:date_of_tasks)
        #how to specify the id that I want to look for?
        erb :"/users/entries" 
    end
 
    get '/organizers/new' do #doesnt load page properly
        erb :"/new_forms/new_organizer"
    end

    post '/organizers' do
        @organizer = Organizer.create(date_of_tasks: params[:date_of_tasks], tasks: params[:tasks])
        redirect to "organizers/#{@organizer.id}"
    end
    #show all organizers
    #add button to lead to adding new organizer
    get '/organizers' do 
        erb :"/user/organizers"
    end

    #add rubytopia; get '/playgame'??
    get '/playgame' do 
        erb :playgame 
    end
end