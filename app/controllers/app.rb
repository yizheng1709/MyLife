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

    get '/playgame' do 
        erb :playgame 
    end

    helpers do 
        def current_user
            User.find_by(id: session[:user_id])
        end

        def redirect_if_not_logged_in
            redirect '/login' unless current_user
        end

        def owner?(object)
            object.user == current_user
        end

        def in_session
            session[:user_id]
        end

        def find_organizer
            Organizer.find_by(id: params[:id])
        end

        def find_entry
            Entry.find_by(id: params[:id])
        end
    end
end