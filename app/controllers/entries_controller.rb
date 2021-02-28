class EntriesController < ApplicationController
    get '/entries' do
        redirect_if_not_logged_in
        @entries = current_user.entries.order("date DESC")
        erb :"/entries/entriess"
    end
end