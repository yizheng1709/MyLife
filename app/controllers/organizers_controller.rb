class OrganizersController < ApplicationController

    get '/organizers/new' do 
        #doesnt load page properly
        redirect_if_not_logged_in
        erb :"/organizers/new_organizer"
    end

    post '/organizers' do
        redirect_if_not_logged_in

        # @organizer = Organizer.create(date_of_tasks: params[:date_of_tasks], tasks: params[:tasks])
        @organizer = Organizer.create(date_of_tasks: params[:date_of_tasks])
        task_array = params[:tasks].delete_if {|task_name| task_name == "" }
        task_array = task_array.collect{|task_name| Task.create(task_name) }
        redirect to "organizers/#{@organizer.id}"
    end

    #show all organizers
    #add button to lead to adding new organizer #done
    get '/organizers' do
         redirect_if_not_logged_in
    
        
        erb :"/organizers"
    end

    patch '/organizers/:id' do
        
    end

    delete '/organizers/:id' do

    end
end