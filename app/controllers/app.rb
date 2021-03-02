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
        redirect_if_not_logged_in
        erb :playgame 
    end

    get '/yoga' do
        redirect_if_not_logged_in
        erb :"activities/yoga"
    end
    get '/cooking' do
        redirect_if_not_logged_in
        erb :"activities/cooking"
    end
    get '/blogilates' do
        redirect_if_not_logged_in
        erb :"activities/blogilates"
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

        # def in_session
        #     session[:user_id]
        # end

        def find_organizer
            Organizer.find_by(id: params[:id])
        end

        def find_entry
            Entry.find_by(id: params[:id])
        end
    end
end