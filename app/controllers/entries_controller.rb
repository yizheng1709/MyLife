class EntriesController < ApplicationController
    get '/entries/new' do 
        redirect_if_not_logged_in
        erb :"/entries/new_entry"
    end

    post '/entries' do
        redirect_if_not_logged_in
        @entry = current_user.entries.create(date: params[:date], content: params[:content].gsub(/\n/, '<br>'))
        if @entry.id
            redirect to "/entries/#{@entry.id}"
        else
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
        if owner?(@entry)
            erb :"/entries/edit"
        else 
            redirect "/entries/#{@entry.id}"
        end 
    end

    patch '/entries/:id/edit' do
        redirect_if_not_logged_in
        @entry = find_entry
        if owner?(@entry)
            @entry.update(content: params[:content].gsub(/\n/, "<br>"))
        end 
        redirect to "/entries/#{@entry.id}"
    end

    delete '/entries/:id/delete' do
        redirect_if_not_logged_in
        @entry = find_entry
        if owner?(@entry)
            @entry.destroy
            redirect to "/entries"
        else
            redirect "/entries"
        end
    end

end