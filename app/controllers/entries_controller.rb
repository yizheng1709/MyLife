class EntriesController < ApplicationController
    get '/entries/new' do 
        redirect_if_not_logged_in
        erb :"/entries/new_entry"
    end

    post '/entries' do
        redirect_if_not_logged_in
        #REMEMBER TO ERROR HANDLE IF USER ALREADY HAS AN EXISTING JOURNAL WITH DATE_OF_TASKS
        @entry = current_user.entries.create(date: params[:date], content: params[:content].gsub(/\n/, '<br>'))
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

    get '/entries/:id' do 
        redirect_if_not_logged_in
        @entry = find_entry
        erb :"/entries/show"
    end
    
    get '/entries' do
        redirect_if_not_logged_in
        @entries = current_user.entries.order("date DESC")
        erb :"/entries/entries"
    end

    get '/entries/:id/edit' do
        redirect_if_not_logged_in
        @entry = find_entry
        # binding.pry
        if @entry.user_id == current_user.id
            # binding.pry
            erb :"/entries/edit"
        else 
            redirect "/entries/#{@entry.id}"
        end 
    end

    patch '/entries/:id/edit' do
        redirect_if_not_logged_in
        #id will come from the form's name attribute
        entry = find_entry
        if @entry.user_id == current_user.id
            entry.update(content: params[:content])
        end 
        redirect to "/entries/#{entry.id}"
    end

    delete '/entries/:id/delete' do
        redirect_if_not_logged_in
        @entry = find_entry
        if @entry.user_id == current_user.id
            @entry.destroy
            redirect to "/entries"
        else
            redirect "/entries"
        end

    end
end