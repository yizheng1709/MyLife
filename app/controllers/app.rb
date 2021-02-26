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
end