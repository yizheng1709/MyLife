class Application < Sinatra::Base 

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
    end

    get '/' do
        erb :index
    end

    post '/login' do 
        #authenticate password
        @user = User.find_by(username: params[:username], password: params[:password]) 
        #user class will have username column
        if @user 
            session[:user_id] = @user.id
        end
        redirect :index #needs work
    end

    get '/sign-up' do
        erb :new_user #shows form for signing up
    end

    post '/signup' do #uses data from new_user.erb
        @user = User.create(username: params[:username], password: params[:password])
        #need to create session hash
        session[:user_id] = @user.id
        redirect to :index 
    end

    #show all entries
    #add button to lead to adding new entry
    get '/entries' do
        id = session[:user_id] 
        @entries = Entry.where('user.id == #{id}').order(:date)
        #how to specify the id that I want to look for?
        erb :entries 
    end
 

    #show all organizers
    #add button to lead to adding new organizer
    get '/organizer' do 
        erb :organizer 
    end

    #add rubytopia; get '/playgame'??
    get '/playgame' do 
        erb :playgame 
    end
end