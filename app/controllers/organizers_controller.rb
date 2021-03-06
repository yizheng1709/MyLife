class OrganizersController < ApplicationController
    
    get '/organizers/new' do 
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
             @messages = @organizer.errors.full_messages 
             erb :"/organizers/new_organizer"
        end 
    end

    get '/organizers/:id' do 
        redirect_if_not_logged_in
        @organizer = find_organizer
        erb :"/organizers/show"
    end

    get '/organizers/:id/edit' do
        redirect_if_not_logged_in
        @organizer = find_organizer
        if owner?(@organizer)
            erb :"/organizers/edit"
        else 
            redirect "/organizers/#{@organizer.id}"
        end 
    end

    get '/organizers' do
        redirect_if_not_logged_in
        @organizers = current_user.organizers.order("date_of_tasks DESC")
        erb :"/organizers/organizers"
    end

    patch '/organizers/:id/edit' do
        redirect_if_not_logged_in
        organizer = find_organizer
        if owner?(organizer)
            params[:tasks][0].each do |id, taskname|
                task = Task.find_by(id: id)
                task.update(task_name: taskname)
            end 
        end
        redirect to "/organizers/#{organizer.id}"
    end

    delete '/organizers/:id/delete' do
        redirect_if_not_logged_in
        set_organizer
        if owner?(@organizer)
            @organizer.destroy
            redirect to "/organizers"
        else
            redirect "/organizers"
        end

    end

    private 
    def set_organizer #rails naming convention
        @organizer = Organizer.find_by(id: params[:id]) #use instance variable
    end

end