class EntriesController < ApplicationController
    get '/entries' do
        user = User.find_by(id: session[:user_id]) 
        @entries = user.entries.order(:date_of_tasks)
        #how to specify the id that I want to look for?
        erb :"/users/entries" 
    end
end