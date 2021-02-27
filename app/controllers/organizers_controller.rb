class OrganizersController < ApplicationController
#add water drinking and average Oz drank per week or month if theres time
    get '/organizers/new' do 
        #doesnt load page properly
        redirect_if_not_logged_in
        erb :"/organizers/new_organizer"
    end

    post '/organizers' do
        redirect_if_not_logged_in
        
        @organizer = current_user.organizers.create(date_of_tasks: params[:date_of_tasks])

        if @organizer.id
            task_array = params[:tasks].delete_if {|task| task[:task_name].strip == "" }
            task_array.each {|task| @organizer.tasks.create(task_name: task[:task_name].strip) }
            redirect to "/organizers/#{@organizer.id}"
        else
             #error handling if there is no date for the organizer
            #  binding.pry
             @messages = @organizer.errors.full_messages 
             erb :"/organizers/new_organizer"
        end 
    end

    get '/organizers/:id' do 
        redirect_if_not_logged_in
        @organizer = Organizer.find_by(id: params[:id])
        erb :"/organizers/show"
    end

    get '/organizers/:id/edit' do
        redirect_if_not_logged_in
        erb :"/organizers/edit"
    end

    #show all organizers
    #add button to lead to adding new organizer #done
    get '/organizers' do
        redirect_if_not_logged_in
        erb :"/organizers/organizers"
    end

    patch '/organizers/:id/edit' do
        redirect_if_not_logged_in
        #id will come from the form's name attribute
        @organizer = Organizer.find_by(id: params[:id])
        # @user = current_user 
        @organizer.tasks.each do |task|
            #how to update each one
        end
        redirect to "/organizers/#{@organizer.id}"
    end

    delete '/organizers/:id/delete' do
        redirect_if_not_logged_in
        @organizer = find_organizer
        if @organizer.user_id == current_user.id
            @organizer.destroy
            redirect to "/organizers"
        else
            redirect "/organizers"
        end

    end

end