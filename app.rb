class Application < Sinatra::Base 
    get '/' do
        erb :index
    end

    post '/login' do 
        user = params[:username]
        password = params[:password]
    end

    get '/sign-up' do
        erb :new_user 
    end

    post '/sign-up' do 
        user = params[:username]
        password = params[:password]
    end

    #adds journal entry
    get '/entry' do
        erb :entry 
    end

    #adds checklist of organizer 
    get '/organizer' do 
        erb :organizer 
    end

    #add rubytopia; get '/playgame'??
    get '/playgame' do 
        erb :playgame 
    end
end