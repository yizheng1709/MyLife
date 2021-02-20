class Application < Sinatra::Base 
    get '/' do
        erb :index
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