class EntriesController < ApplicationController
    get '/entries/new' do 
        redirect_if_not_logged_in
        erb :"/entries/new_entry"
    end

    post '/entries' do
        redirect_if_not_logged_in
        #REMEMBER TO ERROR HANDLE IF USER ALREADY HAS AN EXISTING JOURNAL WITH DATE_OF_TASKS
        @entry = current_user.entries.create(date: params[:date], title: params[:title], content: params[:content])
        # binding.pry
        if @entry.id
            redirect to "/entries/#{@entry.id}"
        else
             #error handling if there is no date for the organizer
            #  binding.pry
             @messages = @entry.errors.full_messages 
             erb :"/entries/new_entry"
        end 
    end
    
    get '/entries' do
        redirect_if_not_logged_in
        @entries = current_user.entries.order("date DESC")
        erb :"/entries/entriess"
    end
end