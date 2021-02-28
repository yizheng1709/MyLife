class OrganizersController < ApplicationController
#add water drinking and average Oz drank per week or month if theres time
    get '/organizers/new' do 
        redirect_if_not_logged_in
        erb :"/organizers/new_organizer"
    end

    post '/organizers' do
        redirect_if_not_logged_in
        #REMEMBER TO ERROR HANDLE IF USER ALREADY HAS AN EXISTING ORGANIZER WITH DATE_OF_TASKS
        @organizer = current_user.organizers.create(date_of_tasks: params[:date_of_tasks])
# binding.pry
        if @organizer.id
            task_array = params[:tasks].delete_if {|task| task[:task_name].strip == "" }
            task_array.each {|task| @organizer.tasks.create(task_name: task[:task_name].strip) }
            ## ^ can call @organizer.tasks and will list all tasks related
            redirect to "/organizers/#{@organizer.id}"
        else
             #error handling if there is no date for the organizer
            #  binding.pry
             @messages = @organizer.errors.full_messages 
             erb :"/organizers/new_organizer"
        end 
    end
#is it necessary to let other users see what another user has?
    get '/organizers/:id' do 
        redirect_if_not_logged_in
        @organizer = find_organizer
        # binding.pry
        erb :"/organizers/show"
    end

    get '/organizers/:id/edit' do
        redirect_if_not_logged_in
        @organizer = find_organizer
        # binding.pry
        if @organizer.user_id == current_user.id
            # binding.pry
            erb :"/organizers/edit"
        else 
            redirect "/organizers/#{@organizer.id}"
        end 
    end

    #show all organizers
    get '/organizers' do
        redirect_if_not_logged_in
        @organizers = current_user.organizers.order("date_of_tasks DESC")
        # binding.pry
        erb :"/organizers/organizers"
    end

    patch '/organizers/:id/edit' do
        redirect_if_not_logged_in
        #id will come from the form's name attribute
        @organizer = find_organizer
        # @user = current_user
         #edit form should have id of each existing id in nested array
        #  binding.pry
        params[:tasks][0].each do |id, taskname|
            # binding.pry
            task = Task.find_by(id: id)
            task.update(task_name: taskname)
            # binding.pry
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