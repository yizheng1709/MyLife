class EntriesController < ApplicationController
    get '/entries' do
        user = current_user 
        @entries = user.entries.order(:date_of_tasks)
        #how to specify the id that I want to look for?
        erb :"/entries" 
    end
end