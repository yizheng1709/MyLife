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

    #show all entries
    #add button to lead to adding new entry
 

    #add rubytopia; get '/playgame'??
    get '/playgame' do 
        erb :playgame 
    end

    helpers do 
        def current_user
            User.find_by(id: session(:user_id))
        end

        def redirect_if_not_logged_in
            redirect '/login' unless current_user
        end

        def owner?(object)
            object.user == current_user
        end

        def find_collection
            
        end
    end
end