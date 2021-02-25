class Application < Sinatra::Base 

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
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
          redirect '/account'
        else 
          redirect '/failure'
        end
    end

    get '/sign-up' do
        erb ":/new-forms/new_user" #shows form for signing up
    end

    post '/signup' do #uses data from new_user.erb
        @user = User.create(username: params[:username], password_digest: params[:password])
        #need to create session hash
        session[:user_id] = @user.id
        redirect to "user/entries" 
    end

    #show all entries
    #add button to lead to adding new entry
    get '/entries' do
        id = session[:user_id] 
        @entries = Entry.where('user.id == #{id}').order(:date)
        #how to specify the id that I want to look for?
        erb :"users/entries" 
    end
 
    get '/organizers/new' do
        erb :"new-forms/new_organizer"
    end

    post '/organizers' do
        @organizer = Organizer.create(date_of_tasks: params[:date_of_tasks], tasks: params[:tasks])
        redirect to "organizers/#{@organizer.id}"
    end
    #show all organizers
    #add button to lead to adding new organizer
    get '/organizers' do 
        erb :"user/organizers"
    end

    #add rubytopia; get '/playgame'??
    get '/playgame' do 
        erb :playgame 
    end
end